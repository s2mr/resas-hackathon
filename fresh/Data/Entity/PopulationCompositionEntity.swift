//
//  PopulationCompositionEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

public struct PoplationCompositionEntity : Unboxable {
	let boundaryYear: Int
	let data:[PoplationCompositions]
	
	public init(unboxer: Unboxer) throws {
		boundaryYear = try unboxer.unbox(key: "boundaryYear")
		data = try unboxer.unbox(key: "data")
	}
	
}

struct PoplationCompositions: Unboxable {
	var label: String
	var data: [PoplationComposition]
	
	init(unboxer: Unboxer) throws {
		label = try unboxer.unbox(key: "label")
		data = try unboxer.unbox(key: "data")
	}
}

struct PoplationComposition: Unboxable {
	var year: Int
	var value: Int
	
	init(unboxer: Unboxer) throws {
		year = try unboxer.unbox(key: "year")
		value = try unboxer.unbox(key: "value")
	}
}
