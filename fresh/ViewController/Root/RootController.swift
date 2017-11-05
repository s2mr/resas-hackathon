//
//  RootController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class RootController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let quizTop = UIStoryboard(name: "QuizTopViewController", bundle: nil).instantiateInitialViewController()!
		quizTop.title = "クイズ"
        
		
		let profileTop = UIStoryboard(name: "ProfileTopViewController", bundle: nil).instantiateInitialViewController()!
		profileTop.title = "プロフィール"
		
        
		self.viewControllers = [UINavigationController(rootViewController: quizTop), profileTop]
		
		// Do any additional setup after loading the view.
		let repo = APIRepository()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
