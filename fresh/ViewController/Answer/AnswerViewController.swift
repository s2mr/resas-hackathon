//
//  AnswerViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
	@IBOutlet weak var questionTextView: UITextView!
	@IBOutlet weak var customView: UIView!
	
	var quiz: Quiz?
	var selectedAnswer: AnswerID?
	
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
		setup()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		clean()
	}
	
	@IBAction func nextQuestionButtonTapped(_ sender: Any) {
		let vc = UIStoryboard(name: "QuizViewController", bundle: nil).instantiateInitialViewController()!
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func finishButtonTapped(_ sender: Any) {
		let vc = UIStoryboard(name: "AnswerViewController", bundle: nil).instantiateInitialViewController()!
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

extension AnswerViewController {
	func setup() {
		quiz = UserStatusRepository.shared.userStatus.quiz
		selectedAnswer = UserStatusRepository.shared.userStatus.selectedAnswer
		
		self.questionTextView.text = quiz?.question
		
		if quiz!.answers[selectedAnswer!.rawValue].collectFlag {
			//正解の場合
			let view = CollectAnswerView(frame: CGRect(x: 0,
			                                           y: 0,
			                                           width: self.customView.frame.width,
			                                           height: self.customView.frame.height))
			view.collectAnswerLabel.text = quiz?.collectAnswer().answer
			self.customView.addSubview(view)
		} else {
			//不正解の場合
			let view = WrongAnswerView(frame: CGRect(x: 0,
			                                         y: 0,
			                                         width: self.customView.frame.width,
			                                         height: self.customView.frame.height))
			view.collectAnswerLabel.text = quiz?.collectAnswer().answer
			view.selectedAnswerLabel.text = quiz?.answers[selectedAnswer!.rawValue].answer
			self.customView.addSubview(view)
		}
	}
	
	func clean() {
		
	}
}
