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
        settings.style.selectedBarBackgroundColor = UIColor.black
        settings.style.selectedBarHeight = 2

        super.viewDidLoad()
        handleDismissToHome()
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
    
    private func handleDismissToHome() {
        let down = UISwipeGestureRecognizer(target: self,
                                            action: #selector(swipeDown(gesture:)))
        down.direction = .down
        topView.addGestureRecognizer(down)
    }
    
    @objc
    private func swipeDown(gesture: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
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
    @IBAction private func handleGoToSetting(_ sender: Any) {
        presentSettingController()
    }
}

extension UserDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
