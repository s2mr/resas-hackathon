//
//  Genre.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

struct Genre: Unboxable {
	var name: String
	
	init(unboxer: Unboxer) throws {
		name = try unboxer.unbox(key: "name")
	}
}
