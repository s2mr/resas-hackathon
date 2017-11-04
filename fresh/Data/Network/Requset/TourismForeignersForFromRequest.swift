//
//  TourismForeignersForFromRequest.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
	struct TourismForeignersForFromRequest {
		var year:Int
		var prefCode:Int
		var purpose:Int
	}
}

extension FreshAPI.TourismForeignersForFromRequest: FreshAPIRequest {
	typealias Response = TourismForeignersForFromEntity
	
	var path: String {
		return "/tourism/foreigners/forFrom"
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
				"purpose": purpose,
		]
	}
}
