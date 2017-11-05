//
//  PartnerDocomoDestination.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension FreshAPI {
	struct PartnerDocomoDestinationRequest {
		var year:Int
		var month:Int
		var periodOfDay:Int
		var periodOfTime:Int
		var gender:String
		var ageRange:String
		var prefCodeDestination:Int
		var cityCodeDestination:Int
		var prefCodeResidence:String
		var cityCodeResidence:String
	}
}

extension FreshAPI.PartnerDocomoDestinationRequest: FreshAPIRequest {
	typealias Response = PartnerDocomoDestinationEntity
	
	var path: String {
		return "/partner/docomo/destination"
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var headers: HTTPHeaders? {
		return FreshAPI().header
	}
	
	var parameters: Parameters? {
		return ["year": year,
				"month": month,
				"periodOfDay": periodOfDay,
				"periodOfTime": periodOfTime,
				"gender": gender,
				"ageRange": ageRange,
				"prefCodeDestination": prefCodeDestination,
				"cityCodeDestination": cityCodeDestination,
				"prefCodeResidence": prefCodeResidence,
				"cityCodeResidence": cityCodeResidence,
		]
	}
}
