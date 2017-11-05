//
//  CityEntity.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct CitiesEntity : Unboxable {
	var cities: [CityEntity]
	
	public init(unboxer: Unboxer) throws {
		cities = try unboxer.unbox(key: "result")
	}
}

struct CityEntity: Unboxable {
	var prefCode: String
	var cityCode: String
	var cityName: String
	var bigCityFlag: Int

	init(unboxer: Unboxer) throws {
		prefCode = try unboxer.unbox(key: "prefCode")
		cityCode = try unboxer.unbox(key: "cityCode")
		cityName = try unboxer.unbox(key: "cityName")
		bigCityFlag = try unboxer.unbox(key: "bigCityFlag")
	}
}

