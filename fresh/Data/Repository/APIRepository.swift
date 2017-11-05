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
	func getPartnerDocomoDestination(year:Int, month:Int, periodOfDay:Int, periodOfTime:Int, gender:String, ageRange:String, prefCodeDestination:Int, cityCodeDestination:Int, prefCodeResidence:String, cityCodeResidence:String) -> Observable<PartnerDocomoDestinationEntity> {
		return api.send(FreshAPI.PartnerDocomoDestinationRequest(year: year, month: month, periodOfDay: periodOfDay,periodOfTime: periodOfTime, gender: gender, ageRange: ageRange, prefCodeDestination: prefCodeDestination, cityCodeDestination: cityCodeDestination, prefCodeResidence: prefCodeResidence, cityCodeResidence: cityCodeResidence))

//		repo.getPartnerDocomoDestination(year: 2016, month: 01, periodOfDay: 1,periodOfTime: 4, gender: "1", ageRange: "15", prefCodeDestination: 13, cityCodeDestination: 13101, prefCodeResidence: "-", cityCodeResidence: "-")
	}
	func getPopulationSum(prefCode:Int, cityCode:String) -> Observable<PopulationSumEntity> {
		return api.send(FreshAPI.PopulationSumRequest(prefCode: prefCode, cityCode: cityCode))

//		let repo = APIRepository()
//		repo.getPopulationSum(prefCode:3, cityCode:"-")
//			.subscribe( onNext: { entity in
//				print("[DEBUG]")
//				print(entity)
//			})
	}
	func getForestryIncomeForContractRevenue(prefCode:Int, cityCode:String) -> Observable<ForestryIncomeForContractRevenueEntity> {
		return api.send(FreshAPI.ForestryIncomeForContractRevenueRequest(prefCode: prefCode, cityCode: cityCode))

//		let repo = APIRepository()
//		repo.getForestryIncomeForContractRevenue(prefCode:3, cityCode:"-")
//			.subscribe {
//				print($0.debugDescription)
//		}
	}
}
