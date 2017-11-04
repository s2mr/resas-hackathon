//
//  UserStatusRepository.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

let MAX_QUIZ_COUNT = 5

class UserStatusRepository {
	var selectedCity: City?
	var selectedGenre: Genre?
	var selectedAnswer: AnswerID?
	var quizIndex: Int = 0
	var exp: Int = 0
	var level: Int = 1
	var dominateCities: [City] = []
	
	static let shared = UserStatusRepository()
	private init() {
	}
	
}
