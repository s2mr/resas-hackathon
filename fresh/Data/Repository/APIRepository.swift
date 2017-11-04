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
	}
	func getMunicipalityFoundation(prefCode: Int, cityCode: String) -> Observable<MunicipalityFoundationEntity> {
		return api.send(FreshAPI.MunicipalityFoundationRequest(prefCode: prefCode, cityCode: cityCode))
		
//		let repo = APIRepository()
//		repo.getMunicipalityFoundation(prefCode: 3, cityCode: "-")
//			.subscribe {
//				print($0.debugDescription)
//		}
	}
	func getTourismForeignersForFrom(year:Int, prefCode:Int, purpose:Int) -> Observable<TourismForeignersForFromEntity> {
		return api.send(FreshAPI.TourismForeignersForFromRequest(year: year, prefCode: prefCode, purpose: purpose))
		
//		let repo = APIRepository()
//		repo.getTourismForeignersForFrom(year: 2012, prefCode:3, purpose:1)
//			.subscribe {
//				print($0.debugDescription)
//		}
	}
}
