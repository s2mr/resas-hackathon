//
//  Entity.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

struct Cities: Unboxable {
	var name: String
	var cities: [City]
	
	init(unboxer: Unboxer) throws {
		name = try unboxer.unbox(key: "name")
		cities = try unboxer.unbox(key: "cities")
	}
}

struct City: Unboxable {
	var name: String
	var latitude: Double
	var longitude: Double
	
	init(unboxer: Unboxer) throws {
		name = try unboxer.unbox(key: "name")
		latitude = try unboxer.unbox(key: "latitude")
		longitude = try unboxer.unbox(key: "longitude")
	}
}
