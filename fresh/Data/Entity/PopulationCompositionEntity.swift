//
//  PopulationCompositionEntity.swift
//  fresh
//
//  Created by 戸羽俊介 on 2017/11/04.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Unbox

//extension APIResult {
	public struct PoplationCompositionEntity : Unboxable {
		let boundaryYear: Int
		public init(unboxer: Unboxer) throws {
			boundaryYear = try unboxer.unbox(key: "boundaryYear")
		}
		
	}
//}

