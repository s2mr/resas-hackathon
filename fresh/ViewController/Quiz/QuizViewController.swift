//
//  QuizViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

let BUTTON_TAG_A = 1
let BUTTON_TAG_B = 2
let BUTTON_TAG_C = 3
let BUTTON_TAG_D = 4

class QuizViewController: UIViewController {
	
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
	
	@IBAction func choiceButtonTapped(_ sender: Any) {
		
	}
	
}

extension QuizViewController {
	
}
