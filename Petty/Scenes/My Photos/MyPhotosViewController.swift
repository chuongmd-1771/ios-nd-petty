//
//  MyPhotosViewController.swift
//  Petty
//
//  Created by chuongmd on 4/23/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable
import XLPagerTabStrip

final class MyPhotosViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet private weak var libraryCollectionView: UICollectionView!
    var itemInfo = IndicatorInfo(title: Constant.itemInfoTitle)
    private var library = [Library]()
    private let columnLayout = ColumnFlowLayout(cellsPerRow: 3,
                                                minimumInteritemSpacing: 10,
                                                minimumLineSpacing: 10,
                                                sectionInset: UIEdgeInsets(top: 5,
                                                                           left: 5,
                                                                           bottom: 5,
                                                                           right: 5))
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryCollectionView.register(cellType: MyPhotosCollectionViewCell.self)
        libraryCollectionView.collectionViewLayout = columnLayout
    }
}

extension MyPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyPhotosCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return library.count
    }
}
