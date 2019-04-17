//
//  homeNewFeedCell.swift
//  Petty
//
//  Created by chuongmd on 4/14/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable

final class homeNewFeedCell: UITableViewCell, NibReusable {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var petNameTextField: UITextField!
    @IBOutlet weak var petStatusTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(true, animated: true)
    }
}

