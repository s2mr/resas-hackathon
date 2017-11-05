//
//  UserStatusRepository.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

public let MAX_QUIZ_COUNT = 2

class UserStatusRepository {
	var userStatus = UserStatus()
	static let shared = UserStatusRepository()
	private init() {
	}
	
}

struct UserStatus{
	var selectedCity: CityEntity?
	var selectedGenre: Genre?
	var selectedAnswer: AnswerID?
	var quizIndex: Int = 0
	var quiz: Quiz?
	var exp: Int = 0
	var level: Int = 1
	var dominateCities: [City] = []
	var numberOfProblemsSolved:Int = 0
	var numberOfproblemsCorrected:Int = 0
	
	func getNextLevelExp() -> Int {
		return level * 10
	}
}
