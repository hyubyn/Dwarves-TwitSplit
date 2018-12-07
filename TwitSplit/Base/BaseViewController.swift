//
//  BaseViewController.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/7/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    func setupView() {
       
    }
    
    func setupNavigationBar() {
        
    }

}
