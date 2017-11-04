//
//  QuizTopViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class QuizTopViewController: UIViewController {
	
	var cityRepo: CityRepository?
	var cities: [City] = []
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		cityRepo = CityRepository()
		cities = (cityRepo?.getCities().cities)!
		// Do any additional setup after loading the view.
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

extension QuizTopViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cities.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
		cell.textLabel?.text = cities[indexPath.row].name
		
		return cell
	}
}

extension QuizTopViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		UserStatusRepository.shared.userStatus.selectedCity = cities[indexPath.row]
		let vc = UIStoryboard(name: "GenreViewController", bundle: nil).instantiateInitialViewController() as! GenreViewController
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
