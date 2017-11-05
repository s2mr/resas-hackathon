//
//  QuizViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
	
	@IBOutlet weak var questionTextView: UITextView!
	
	@IBOutlet weak var choiceButtonA : UIButton!
	@IBOutlet weak var choiceButtonB : UIButton!
	@IBOutlet weak var choiceButtonC : UIButton!
	@IBOutlet weak var choiceButtonD : UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.title = UserStatusRepository.shared.userStatus.selectedGenre?.name
		setupUI()
	}
	
	@IBAction func choiceButtonTapped(_ sender: UIButton) {
		UserStatusRepository.shared.userStatus.selectedAnswer = AnswerID(rawValue: sender.tag)
		let vc = UIStoryboard(name: "AnswerViewController", bundle: nil).instantiateInitialViewController()!
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

extension QuizViewController {
	func setupUI() {
		if let quiz = QuizRepository.shared.next(userStatus: UserStatusRepository.shared.userStatus) {
			UserStatusRepository.shared.userStatus.quiz = quiz
			UserStatusRepository.shared.userStatus.numberOfProblemsSolved += 1
			DispatchQueue.main.async {
				self.questionTextView.text = quiz.question

				
				//FIXME:
				/*
				self.choiceButtonA.setTitle(quiz.answers[0].answer, for: .normal)
				self.choiceButtonB.setTitle(quiz.answers[1].answer, for: .normal)
				self.choiceButtonC.setTitle(quiz.answers[2].answer, for: .normal)
				self.choiceButtonD.setTitle(quiz.answers[3].answer, for: .normal)
*/
			}
		} else {
			let vc = UIStoryboard(name: "ResultViewController", bundle: nil).instantiateInitialViewController()!
			self.navigationController?.pushViewController(vc, animated: true)
		}
	}
}
