//
//  Cities.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
    struct CitiesRequest {
        var prefCode:Int
    }
}

extension FreshAPI.CitiesRequest: FreshAPIRequest {
    typealias Response = Cities
    
    var path: String {
        return "/cities"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return FreshAPI().header
    }
    
    var parameters: Parameters? {
        return ["prefCode": prefCode]
    }
}
