//
//  GenreRepository.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

class GenreRepository {
	func getGenres() -> [Genre] {
		let jsonStr = Utility.loadJson(name: "genre")
		return try! Genres(unboxer: Unboxer(data: jsonStr.data(using: String.Encoding.utf8)!)).genres
	}
}
