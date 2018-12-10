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
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "tableViewCell"
    
    var presenter: HomePresenterProtocol?
    
    var listMessage = [Tweat]()
    
    override func setupView() {
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        addButton.layer.masksToBounds = false
        addButton.layer.shadowRadius = 1.0
        addButton.layer.shadowOpacity = 0.5
        addButton.layer.cornerRadius = addButton.frame.width / 2
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
        
        setupDisplay()
    }

    override func setupNavigationBar() {
        title = "Home"
        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        presenter?.router?.presentPostNewTweatModally(from: self)
    }
}

// MARK - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    
    func setupDisplay() {
        presenter?.fetchListMessage()
    }
    
    func showListMessage(message: [Tweat]) {
        listMessage = message
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: listMessage.count - 1, section: 0), at: .bottom, animated: true)
    }
    
    func showErrorFromGetMessage(error: String) {
        showAlert(title: "Error", message: error, okAction: nil)
    }
    
    
}

// MARK - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.messageContentLabel.text = listMessage[indexPath.row].localizedString()
        cell.timeLabel.text = "Posted \(Utils.getDifferenceTimeDisplaying(timeStampString: listMessage[indexPath.row].id))"
        cell.selectionStyle = .none
        return cell
    }
    
    
}
