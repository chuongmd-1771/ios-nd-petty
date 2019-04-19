//
//  homeNewFeedCell.swift
//  Petty
//
//  Created by chuongmd on 4/14/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//
import UIKit
import Reusable
import Firebase
import Kingfisher

final class HomeNewFeedCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var postImage: UIImageView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var userAvatar: UIImageView!
    @IBOutlet private weak var gradientView: GradientView!
    
    var cellButtonTapAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Database.database().reference().child("users").observe(.childAdded) { [weak self] (snapshot) in
            guard let self = self else { return }
            if let value = snapshot.value as? NSDictionary {
                guard let profileImageUrl = value["profileImageUrl"] as? String else { return }
                let url = URL(string: profileImageUrl)
                self.userAvatar.kf.setImage(with: url)
                self.userAvatar.kf.cancelDownloadTask()
            }
        }
    }
    
    @IBAction private func handleAvatarButton(_ sender: UIButton) {
        cellButtonTapAction?()
    }
    
    func configure(with model: Post) {
        guard let url = URL(string: model.image) else { return }
        postImage.kf.setImage(with: url)
        statusLabel.text = model.caption
    }
}
