//
//  QuizTopViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import RxSwift

class QuizTopViewController: UIViewController {
	
	var apiRepo: APIRepository?
	var cities: [CityEntity] = []
	var disposeBag = DisposeBag()
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		apiRepo = APIRepository()
		apiRepo?.api.send(FreshAPI.CitiesRequest(prefCode: 3))
			.subscribe(onNext: {  c in
				self.setCities(citiesEntity: c)
			})
			.disposed(by: disposeBag)
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setCities(citiesEntity: CitiesEntity) {
		 self.cities = citiesEntity.cities
		tableView.reloadData()
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
		cell.textLabel?.text = cities[indexPath.row].cityName
		
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
