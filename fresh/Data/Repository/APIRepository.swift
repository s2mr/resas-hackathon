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
}
