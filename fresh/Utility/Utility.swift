//
//  Utility.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct Utility {
	public static func loadJson(name: String) -> String {
		let path = Bundle.main.path(forResource: name, ofType: "json")
		let jsonStr = try! String(contentsOfFile: path!)
		return jsonStr
	}
}
