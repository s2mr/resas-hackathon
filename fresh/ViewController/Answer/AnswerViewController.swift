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
		setupUI()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		cleanUI()
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
	func setupUI() {
		self.questionTextView.text = UserStatusRepository.shared.userStatus.quiz?.question
	}
	
	func cleanUI() {
		
	}
}
