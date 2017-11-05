//
//  TourismForeignersForFromEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct TourismForeignersForFromEntity : Unboxable {
	let year: Int
	let prefCode: Int
	let prefName: String
	let purpose: String
	let changes: [TourismForeignersForFroms]
	
	public init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		prefCode = try unboxer.unbox(key: "prefCode")
		prefName = try unboxer.unbox(key: "prefName")
		purpose = try unboxer.unbox(key: "purpose")
		changes = try unboxer.unbox(key: "changes")
	}
	
}

struct TourismForeignersForFroms: Unboxable {
	var countryCode: String
	var countryName: String
	var data: [TourismForeigners]
	
	init(unboxer: Unboxer) throws {
		countryCode = try unboxer.unbox(key: "countryCode")
		countryName = try unboxer.unbox(key: "countryName")
		data = try unboxer.unbox(key: "data")
	}
}

struct TourismForeigners: Unboxable {
	var year: Int
	var quarter: Int
	var value:Int
	
	init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		quarter = try unboxer.unbox(key: "quarter")
		value = try unboxer.unbox(key: "value")
	}
}
