//
//  PopulationSum.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/05.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct PopulationSumEntity : Unboxable {
	let line: PopulationSums
	var bar: datas

	public init(unboxer: Unboxer) throws {
		line = try unboxer.unbox(key: "line")
		bar = try unboxer.unbox(key: "bar")
	}
	
}

struct PopulationSums: Unboxable {
	var boundaryYear: Int
	var data: [PopulationSum]
	
	init(unboxer: Unboxer) throws {
		boundaryYear = try unboxer.unbox(key: "boundaryYear")
		data = try unboxer.unbox(key: "data")
	}
}

struct PopulationSum: Unboxable {
	var year: Int
	var value:Int
	
	init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		value = try unboxer.unbox(key: "value")
	}
}

struct datas: Unboxable {
	var data: [data]
	
	init(unboxer: Unboxer) throws {
		data = try unboxer.unbox(key: "data")
	}
}

struct data: Unboxable {
	var year: Int
	var sum: Double
	var `class`: [dataCalsses]
	
	init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		sum = try unboxer.unbox(key: "sum")
		`class` = try unboxer.unbox(key: "class")
	}
}

struct dataCalsses: Unboxable {
	var label: String
	var value: Double
	
	init(unboxer: Unboxer) throws {
		label = try unboxer.unbox(key: "label")
		value = try unboxer.unbox(key: "value")
	}
}
