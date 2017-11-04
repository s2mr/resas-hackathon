//
//  PopulationComposition.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
	struct PopulationCompositionRequest {
		var prefCode:Int
		var cityCode:String
	}
}

extension FreshAPI.PopulationCompositionRequest: FreshAPIRequest {
	typealias Response = PoplationCompositionEntity
	
	var path: String {
		return "/population/composition/perYear"
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
