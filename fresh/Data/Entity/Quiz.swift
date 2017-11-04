//
//  Question.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

struct QuizData: Unboxable {
	var quizzes: [Quizzes]
	
	init(unboxer: Unboxer) throws {
		quizzes = try unboxer.unbox(keyPath: "datas")
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
}

struct Answer: Unboxable {
	var answer: String
	var collectFlag: Bool
	
	init(unboxer: Unboxer) throws {
		answer = try unboxer.unbox(key: "answer")
		collectFlag = try unboxer.unbox(key: "collectFlag")
	}
}
