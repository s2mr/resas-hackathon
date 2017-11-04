//
//  CityDataStore.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

class CityDataStore {
	
	init() {
		
	}
	
	private func loadJson() {
		let path = Bundle.main.path(forResource: "iwate", ofType: "json")
		do{
			let jsonStr = try String(contentsOfFile: path!)
			
			
			
//			let json =  JSON.parse(jsonStr)
//			return json
			print(jsonStr)
		} catch{
//			return nil
		}
	}
	
	func getCities() {
		loadJson()
		
//		let cities = []
		
		
	}
}
