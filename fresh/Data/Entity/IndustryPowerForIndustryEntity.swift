//
//  IndustryPowerForIndustryEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct IndustryPowerForIndustryEntity : Unboxable {
	let prefName: Int
	let prefCode: Int
	let sicCode:String
	let sicName:String
	let data:[PoplationCompositions]
	
	public init(unboxer: Unboxer) throws {
		prefName = try unboxer.unbox(key: "prefName")
		prefCode = try unboxer.unbox(key: "prefCode")
		sicCode = try unboxer.unbox(key: "sicCode")
		sicName = try unboxer.unbox(key: "sicName")
		data = try unboxer.unbox(key: "data")
	}
	
}

struct PoplationCompositions: Unboxable {
	let simcCode: String
	let simcName: String
	let value:Double
	let employee:Double
	let labor:Double
	
	init(unboxer: Unboxer) throws {
		simcCode = try unboxer.unbox(key: "simcCode")
		simcName = try unboxer.unbox(key: "simcName")
		value = try unboxer.unbox(key: "value")
		employee = try unboxer.unbox(key: "employee")
		labor = try unboxer.unbox(key: "labor")
	}
}
