//
//  ResultViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import Alamofire

class ResultViewController: UIViewController {
	
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var progressLabel: UILabel!
	@IBOutlet weak var progressView: UIProgressView!
	
	
	@IBOutlet weak var levelValueLabel: UILabel!
	@IBOutlet weak var levelProgressView: UIProgressView!
	@IBOutlet weak var levelProgressValueLabel: UILabel!
	
	@IBOutlet weak var correctCountLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "集計"
		
		let quizCount = QuizRepository().quizData?.quizzes.count
		let numberOfProblemsSolved = QuizRepository().numberOfProblemsSolved // 解いた問題数
		let numberOfproblemsCorrected = QuizRepository().numberOfproblemsCorrected // 正解した問題数
		
		// 正解数
		correctCountLabel.text = "\(numberOfproblemsCorrected) / \(numberOfProblemsSolved)"
		
		// 市ごとの進捗度
		progressView.transform = CGAffineTransform(scaleX: 1.0, y: 10.0)
		progressView.setProgress(0.5, animated: true)
		progressLabel.text = "\(Int(progressView.progress * 100))%"
		
		// レベル
		let level:Int = UserStatusRepository.shared.userStatus.level
//		let exp:Int = UserStatusRepository.shared.userStatus.exp
		let exp = 3
		let nextLevelExp = UserStatusRepository.shared.userStatus.getNextLevelExp()
		levelValueLabel.text = "\(level)"
		levelProgressView.transform = CGAffineTransform(scaleX: 1.0, y: 10.0)
		levelProgressView.setProgress(Float(Float(exp) / Float(nextLevelExp)), animated: true)
		levelProgressValueLabel.text = "\(Int(Float(levelProgressView.progress) * Float(nextLevelExp)))/\(Int(nextLevelExp))"
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func toQuizTopButtonTapped(_ sender: Any) {
		let vc = UIStoryboard(name: "QuizTopViewController", bundle: nil).instantiateInitialViewController()!
		
		self.navigationController?.pushViewController(vc, animated: true)
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
