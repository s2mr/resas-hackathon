//
//  CityRepository.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

class CityRepository {
	
	var dataStore: CityDataStore
	
	init() {
		dataStore = CityDataStore()
	}
	
	func getCities() -> Cities {
		return dataStore.getCities()
	}
}
