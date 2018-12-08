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
    
    func showAlert(title: String, message: String, okAction:(()->())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
            okAction?()
        }))
        self.navigationController?.present(alert, animated: true, completion: nil)
    }

}
