//
//  ViewController.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/7/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var addButton: UIButton!
    
    
    override func setupView() {
        addButton.layer.borderWidth = 0.1
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        addButton.layer.masksToBounds = false
        addButton.layer.shadowRadius = 1.0
        addButton.layer.shadowOpacity = 0.5
        addButton.layer.cornerRadius = addButton.frame.width / 2
    }

    override func setupNavigationBar() {
        title = "Home"
        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
    }
}

