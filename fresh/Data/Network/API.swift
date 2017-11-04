//
//  API.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

protocol API {
    var sessionConfiguration: URLSessionConfiguration { get }
    var manager: SessionManager { get }
    var baseURL: URL { get }
}

protocol APIRespondable {
    associatedtype Response
    func response(from: Any?) throws -> Response
}

protocol APIRequest: APIRespondable {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }	
    func validate(statusCode: Int) -> Bool
}

extension APIRequest {
    var encoding: ParameterEncoding {
        return URLEncoding.methodDependent
    }
    
    public func validate(statusCode: Int) -> Bool {
        return (200..<300).contains(statusCode)
    }
}
