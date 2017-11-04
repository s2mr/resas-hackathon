//
//  GenreViewController.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/04.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	let genreRepo = GenreRepository()
	
	var genres: [Genre] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		genres = genreRepo.getGenres()
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

extension GenreViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GenreCollectionViewCell
		cell.image.image = UIImage(named: genres[indexPath.row].getImageName())
		cell.nameLabel.text = genres[indexPath.row].name
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return genres.count
	}
}

extension GenreViewController: UICollectionViewDelegateFlowLayout {
	// 希望のセルサイズを返す
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let size = self.view.frame.size.width/2-10
		return CGSize(width: size, height: size)
	}
}
