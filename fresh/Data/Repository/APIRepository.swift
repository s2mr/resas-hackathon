//
//  API.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import RxSwift
import Unbox

class APIRepository {
	let api = FreshAPI()
	func getPopulationComposition(prefCode: Int, cityCode: String) -> Observable<PoplationCompositionEntity> {
		return api.send(FreshAPI.PopulationCompositionRequest(prefCode: prefCode, cityCode: cityCode))
		
//		let repo = APIRepository()
//		repo.getPopulationComposition(prefCode: 3, cityCode: "-")
//			.subscribe {
//				print($0.debugDescription)
//		}
	}
	func getIndustryPowerForIndustry(year:Int, prefCode:Int, cityCode:String, sicCode:String) -> Observable<IndustryPowerForIndustryEntity> {
		return api.send(FreshAPI.IndustryPowerForIndustryRequest(year: year, prefCode: prefCode, cityCode: cityCode, sicCode: sicCode))
		
//		let repo = APIRepository()
//		repo.getIndustryPowerForIndustry(year:2012, prefCode:3, cityCode:"-", sicCode:"-")
//			.subscribe {
//				print($0.debugDescription)
//		}
	}
}
