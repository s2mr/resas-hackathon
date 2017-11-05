//
//  CollectAnswerView.swift
//  fresh
//
//  Created by 下村一将 on 2017/11/05.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class CollectAnswerView: UIView {
	
	@IBOutlet weak var collectAnswerLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		viewFromXib()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		viewFromXib()
	}
	
	func viewFromXib() {
		let nib = UINib(nibName: "CollectAnswerView", bundle: nil)
		let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
		self.addSubview(view)
	}
}
