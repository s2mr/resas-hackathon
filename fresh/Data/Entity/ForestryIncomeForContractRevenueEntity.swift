//
//  ForestryIncomeForContractRevenueEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct ForestryIncomeForContractRevenueEntity : Unboxable {
	let prefCode: Int
	let prefName: String
	let cityCode:String
	let cityName:String
	let years:[ForestryIncomeForContractRevenues]
	
	public init(unboxer: Unboxer) throws {
		prefCode = try unboxer.unbox(key: "prefCode")
		prefName = try unboxer.unbox(key: "prefName")
		cityCode = try unboxer.unbox(key: "cityCode")
		cityName = try unboxer.unbox(key: "cityName")
		years = try unboxer.unbox(key: "years")
	}
	
}

struct ForestryIncomeForContractRevenues: Unboxable {
	let year: Int
	let value: Double
	
	init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		value = try unboxer.unbox(key: "value")
	}
}
