//
//  HomeViewController.swift
//  Petty
//
//  Created by chuongmd on 4/5/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable

final class HomeViewController: UIViewController {
    @IBOutlet private weak var petImageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    @IBAction func handleGotoUserDetail(_ sender: Any) {
        let vc = UserDetailViewController.instantiate()
        present(vc, animated: true)
    }
    
    func setupTableView() {
        petImageTableView.register(cellType: homeNewFeedCell.self)
    }
}

extension HomeViewController: StoryboardSceneBased, NibLoadable {
    static var sceneStoryboard = Storyboards.main
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: homeNewFeedCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
}
