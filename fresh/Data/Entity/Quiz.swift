//
//  Question.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Unbox

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
