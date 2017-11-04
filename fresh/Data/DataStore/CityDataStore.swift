//
//  CityDataStore.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

class CityDataStore {
	
	init() {
		
	}
	

	
	func getCities() -> Cities {
		let jsonStr = Utility.loadJson(name: "iwate")
		return try! Cities(unboxer: Unboxer(data: jsonStr.data(using: String.Encoding.utf8)!))
	}
}
