//
//  UserDetailViewController.swift
//  Petty
//
//  Created by chuongmd on 4/10/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable
import XLPagerTabStrip

final class UserDetailViewController: BaseButtonBarPagerTabStripViewController<MenuBarButtonCell> {
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var avatarImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: Constant.menuBarCellNibName,
                                                      bundle: Bundle(for: MenuBarButtonCell.self),
                                                      width: { _ in
                                                        return 55.0
        })
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let myPhotosViewController = MyPhotosViewController(itemInfo: IndicatorInfo(image: #imageLiteral(resourceName: "pet")))
        let followerViewController = FollowerViewController(itemInfo: IndicatorInfo(image: #imageLiteral(resourceName: "following")))
        let followingViewController = FollowingViewController(itemInfo: IndicatorInfo(image: #imageLiteral(resourceName: "follower")))
        let likedViewController = LikedCollectionViewController(itemInfo: IndicatorInfo(image: #imageLiteral(resourceName: "favorite")))
        return [myPhotosViewController, followerViewController, followingViewController, likedViewController]
    }
    
    override func configure(cell: MenuBarButtonCell, for indicatorInfo: IndicatorInfo) {
        cell.iconImage.image = indicatorInfo.image
    }
}

extension UserDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
