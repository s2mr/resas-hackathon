//
//  IndustryPowerForIndustryRequest.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
	struct IndustryPowerForIndustryRequest {
		var year:Int
		var prefCode:Int
		var cityCode:String
		var sicCode:String
	}
}

extension FreshAPI.IndustryPowerForIndustryRequest: FreshAPIRequest {
	typealias Response = IndustryPowerForIndustryEntity
	
	var path: String {
		return "/industry/power/forIndustry"
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var headers: HTTPHeaders? {
		return FreshAPI().header
	}
	
	var parameters: Parameters? {
		return ["year": year,
				"prefCode": prefCode,
				"cityCode": cityCode,
				"sicCode": sicCode
		]
	}
}
