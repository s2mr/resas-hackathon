//
//  ForestryIncomeForContractRevenueRequest.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
	struct ForestryIncomeForContractRevenueRequest {
		var prefCode:Int
		var cityCode:String
	}
}

extension FreshAPI.ForestryIncomeForContractRevenueRequest: FreshAPIRequest {
	typealias Response = ForestryIncomeForContractRevenueEntity
	
	var path: String {
		return "/forestry/income/forContractRevenue"
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var headers: HTTPHeaders? {
		return FreshAPI().header
	}
	
	var parameters: Parameters? {
		return ["prefCode": prefCode,
				"cityCode": cityCode,
		]
	}
}
