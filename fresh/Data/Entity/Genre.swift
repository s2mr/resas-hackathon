//
//  Genre.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

struct Genres: Unboxable {
	var genres: [Genre]
	
	init(unboxer: Unboxer) throws {
		genres = try unboxer.unbox(key: "genres")
	}
}

struct Genre: Unboxable {
	var name: String
	private var fileName: String
	
	init(unboxer: Unboxer) throws {
		name = try unboxer.unbox(key: "name")
		fileName = try unboxer.unbox(key: "file-name")
	}
	
	func getImageName() -> String {
		return "genre-" + fileName
	}
}
