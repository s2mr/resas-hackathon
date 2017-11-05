//
//  QuizRepository.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

class QuizRepository {
	var quizData: QuizData?
	
	init() {
		let jsonStr = Utility.loadJson(name: "quiz")
		do {
			quizData = try QuizData(unboxer: Unboxer(data: jsonStr.data(using: .utf8)!))
		} catch {
			print(error)
		}
	}
	
	func next(userStatus: UserStatus) -> Quiz? {
		if userStatus.quizIndex < MAX_QUIZ_COUNT {
			if let quizzes = quizData?.getQuizzes(by: userStatus.selectedGenre!.id)?.quizzes {
				let quiz = quizzes[userStatus.quizIndex]
				UserStatusRepository.shared.userStatus.quizIndex += 1
				return quiz
			}
		}
		
		return nil
	}
}
