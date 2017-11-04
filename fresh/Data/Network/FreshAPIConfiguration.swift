//
//  FreshAPIConfiguration.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

extension FreshAPI {
    public struct Configuration {
        public var sessionConfiguration: URLSessionConfiguration
        public var baseURL: URL
        public var header: HTTPHeaders
    }
}

public extension FreshAPI.Configuration {
    static var `default`: FreshAPI.Configuration {
        let sessionConfiguration: URLSessionConfiguration = .default
        return FreshAPI.Configuration(sessionConfiguration: sessionConfiguration,
                                     baseURL: URL(string: "https://opendata.resas-portal.go.jp/api/v1")!,
                                     header: ["X-API-KEY": Secret().apikey])
    }
}
