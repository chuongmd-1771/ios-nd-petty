//
//  ColumnFlowLayout.swift
//  Petty
//
//  Created by chuongmd on 4/17/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

final class ColumnFlowLayout: UICollectionViewFlowLayout {
    let cellsPerRow: Int
    
    init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
        self.cellsPerRow = cellsPerRow
        super.init()
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let insetLeft = sectionInset.left
        let insetRight = sectionInset.right
        let safeAreaInsetLeft = collectionView.safeAreaInsets.left
        let safeAreaInsetRight = collectionView.safeAreaInsets.right
        let minimumSpacing = minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let marginsAndInsets = insetLeft + insetRight + safeAreaInsetLeft + safeAreaInsetRight + minimumSpacing
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
}

extension UICollectionViewCell {
    
}
