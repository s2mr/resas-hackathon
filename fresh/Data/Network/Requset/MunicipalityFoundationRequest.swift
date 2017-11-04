//
//  MunicipalityFoundationRequest.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
	struct MunicipalityFoundationRequest {
		var prefCode:Int
		var cityCode:String
	}
}

extension FreshAPI.MunicipalityFoundationRequest: FreshAPIRequest {
	typealias Response = MunicipalityFoundationEntity
	
	var path: String {
		return "/municipality/foundation/perYear"
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var headers: HTTPHeaders? {
		return FreshAPI().header
	}
	
	var parameters: Parameters? {
		return ["prefCode": prefCode,
				"cityCode": cityCode
		]
	}
}
