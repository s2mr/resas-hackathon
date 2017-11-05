//
//  FreshAPI.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Unbox

protocol FreshAPIRespondable: APIRespondable {
    var keyPathForResponse: String? { get }
}

extension FreshAPIRespondable {
    // protocol extension
    var keyPathForResponse: String? {
        return "result"
    }
    
    func validateResponse(_ json: Any?) throws -> UnboxableDictionary {
        guard let json = json as? UnboxableDictionary else {
            throw UnboxError.invalidData
        }
        return json
    }
}

extension FreshAPIRespondable where Response: Unboxable {
    func response(from json: Any?) throws -> Response {
        let json = try validateResponse(json)
        if let keyPath = keyPathForResponse {
            return try unbox(dictionary: json, atKeyPath: keyPath)
        } else {
            return try unbox(dictionary: json)
        }
    }
}

protocol FreshAPIRequest: APIRequest, FreshAPIRespondable {}

public class FreshAPI: API {
    var sessionConfiguration: URLSessionConfiguration
    var manager: SessionManager
    let baseURL: URL
    let header: HTTPHeaders
    
    init(configuration: FreshAPI.Configuration = .default) {
        self.sessionConfiguration = configuration.sessionConfiguration
        self.manager = SessionManager(configuration: sessionConfiguration)
        self.baseURL = configuration.baseURL
        self.header = configuration.header
    }
    
    func send<Req: FreshAPIRequest>(_ request: Req) -> Observable<Req.Response> {
        let url: URL = baseURL.appendingPathComponent(request.path)
        
        return Observable<Req.Response>.create { observer -> Disposable in
            let req = Alamofire.request(url, method: request.method, parameters: request.parameters,
                                        encoding: request.encoding, headers: request.headers)
            print(req.debugDescription)
            req.responseJSON(completionHandler: { response in
                print(response.debugDescription)
                switch response.result {
                case .success(let value):
                    do {
                        let res = try request.response(from: value)
                        observer.onNext(res)
                        observer.onCompleted()
                    } catch let error {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            })
            
            return Disposables.create()
        }
    }
}
