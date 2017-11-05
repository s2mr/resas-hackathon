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
	static var shared = QuizRepository()
	
	private init() {
		prepareQuiz()
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
	
	private func prepareQuiz() {
		let apiRepo = APIRepository()
		
		let jsonStr = Utility.loadJson(name: "quiz")
		do {
			quizData = try QuizData(unboxer: Unboxer(data: jsonStr.data(using: .utf8)!))
		} catch {
			print(error)
		}
		
		let genre = UserStatusRepository.shared.userStatus.selectedGenre
		let city = UserStatusRepository.shared.userStatus.selectedCity
		switch genre!.id {
		case 1:
			apiRepo.getPopulationComposition(prefCode: 3, cityCode: city!.prefCode)
				.subscribe(onNext: { peEntity in
					print("[DEBUG]")
					print(peEntity)
				})
			
		case 8:
			apiRepo.getMunicipalityFoundation(prefCode: 3, cityCode: city!.prefCode)
		default:
			print()
		}
		
	}
	
	
}
