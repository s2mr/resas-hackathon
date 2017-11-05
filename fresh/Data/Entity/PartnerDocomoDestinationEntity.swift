//
//  PartnerDocomoDestinationEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct PartnerDocomoDestinationEntity : Unboxable {
	let total: Int
	let prefs: [PartnerDocomoDestinations]
	
	public init(unboxer: Unboxer) throws
	{
		total = try unboxer.unbox(key: "total")
		prefs = try unboxer.unbox(key: "prefs")
	}
	
}

struct PartnerDocomoDestinations: Unboxable {
	let prefCode: Int
	let prefName: String
	let total:Int
	let cities:[PartnerDocomoDestination]
	
	init(unboxer: Unboxer) throws {
		prefCode = try unboxer.unbox(key: "prefCode")
		prefName = try unboxer.unbox(key: "prefName")
		total = try unboxer.unbox(key: "total")
		cities = try unboxer.unbox(key: "cities")
	}
}

struct PartnerDocomoDestination: Unboxable {
	let cityCode: String
	let cityName: String
	let total:Int
	let genders:[PartnerDocomoDestinationGenders]
	
	init(unboxer: Unboxer) throws {
		cityCode = try unboxer.unbox(key: "cityCode")
		cityName = try unboxer.unbox(key: "cityName")
		total = try unboxer.unbox(key: "total")
		genders = try unboxer.unbox(key: "genders")
	}
}

struct PartnerDocomoDestinationGenders: Unboxable {
	let gender: String
	let total: Int
	let ageRanges:[PartnerDocomoDestinationGender]
	
	init(unboxer: Unboxer) throws {
		gender = try unboxer.unbox(key: "gender")
		total = try unboxer.unbox(key: "total")
		ageRanges = try unboxer.unbox(key: "ageRanges")
	}
}

struct PartnerDocomoDestinationGender: Unboxable {
	let ageRange: String
	let value: Int
	
	init(unboxer: Unboxer) throws {
		ageRange = try unboxer.unbox(key: "ageRange")
		value = try unboxer.unbox(key: "value")
	}
}
