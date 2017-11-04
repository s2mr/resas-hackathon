//
//  MunicipalityFoundationEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct MunicipalityFoundationEntity : Unboxable {
	let prefName: String
	let prefCode: Int
	let cityName: String
	let cityCode: String
	let data:[MunicipalityFoundations]
	
	public init(unboxer: Unboxer) throws {
		prefName = try unboxer.unbox(key: "prefName")
		prefCode = try unboxer.unbox(key: "prefCode")
		cityName = try unboxer.unbox(key: "cityName")
		cityCode = try unboxer.unbox(key: "cityCode")
		data = try unboxer.unbox(key: "data")
	}
	
}

struct MunicipalityFoundations: Unboxable {
	var year: String
	var value: Double
	
	init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		value = try unboxer.unbox(key: "value")
	}
}
