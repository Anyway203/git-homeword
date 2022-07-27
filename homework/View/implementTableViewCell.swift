//
//  implementTableViewCell.swift
//  implement
//
//  Created by ESB17979 on 2022/6/22.
//

import UIKit

class implementTableViewCell: UITableViewCell {

    @IBOutlet var tracknameLabel: UILabel! {
        didSet {
            tracknameLabel.adjustsFontForContentSizeCategory = true
            tracknameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var artistnameLabel: UILabel! {
        didSet {
            artistnameLabel.adjustsFontForContentSizeCategory = true
            artistnameLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var movieImageView: UIImageView! {
        didSet {
            movieImageView.layer.cornerRadius = 20.0
            movieImageView.clipsToBounds = true
        }
    }
//    @IBOutlet var favoriteImageView: UIImageView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        self.tintColor = .systemYellow
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


}

