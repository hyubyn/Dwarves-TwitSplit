//
//  HomeTableViewCell.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageContentLabel: UILabel!
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContainerView.layer.cornerRadius = 5.0
        cellContainerView.backgroundColor = .white
        cellContainerView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cellContainerView.layer.shadowColor = UIColor.black.cgColor
        cellContainerView.layer.shadowOpacity = 0.3
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        avatarImageView.backgroundColor = .random()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
