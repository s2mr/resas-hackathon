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
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "集計"
		
		progressView.transform = CGAffineTransform(scaleX: 1.0, y: 10.0)
		progressView.setProgress(0.5, animated: true)
		progressLabel.text = "\(Int(progressView.progress * 100))%"
		
		// レベル
		let level:Int = UserStatusRepository.shared.userStatus.level
		let exp:Int = UserStatusRepository.shared.userStatus.exp
		let nextLevelExp = UserStatusRepository.shared.userStatus.getNextLevelExp()
		levelValueLabel.text = "\(level)"
		levelProgressView.transform = CGAffineTransform(scaleX: 1.0, y: 10.0)
		levelProgressView.setProgress(Float(exp / nextLevelExp), animated: true)
		levelProgressValueLabel.text = "\(Int(levelProgressView.progress * 100))/\(Int(nextLevelExp))"
		
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
