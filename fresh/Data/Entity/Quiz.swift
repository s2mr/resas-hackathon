//
//  Question.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

enum AnswerID: Int {
	case A = 0
	case B = 1
	case C = 2
	case D = 3
}

struct QuizData: Unboxable {
	var quizzes: [Quizzes]
	
	init(unboxer: Unboxer) throws {
		quizzes = try unboxer.unbox(keyPath: "datas")
	}
	
	func getQuizzes(by genreId: Int) -> Quizzes? {
		for quiz in quizzes {
			if quiz.genreId == genreId {
				return quiz
			}
		}
		return nil
	}
}

struct Quizzes: Unboxable {
	var genreId: Int
	var quizzes: [Quiz]
	
	init(unboxer: Unboxer) throws {
		genreId = try unboxer.unbox(key: "genreId")
		quizzes = try unboxer.unbox(key: "problems")
	}
}

struct Quiz: Unboxable {
	var question: String
	var answers: [Answer]
	
	init(unboxer: Unboxer) throws {
		question = try unboxer.unbox(key: "question")
		answers = try unboxer.unbox(key: "answers")
	}
	
	func collectAnswer() -> Answer {
		var answer: Answer!
		for a in answers {
			if a.collectFlag {
				answer = a
			}
		}
		return answer
	}
}

struct Answer: Unboxable {
	var answer: String
	var collectFlag: Bool
	
	init(unboxer: Unboxer) throws {
		answer = try unboxer.unbox(key: "answer")
		collectFlag = try unboxer.unbox(key: "collectFlag")
	}
}
