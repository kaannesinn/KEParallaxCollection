//
//  KEStoryLikeCollectionView.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 25.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

class KEStoryLikeCollectionView: UICollectionView {

    func prepareFlowLayout(cellWidth: CGFloat, cellHeight: CGFloat, scrollDirection: UICollectionView.ScrollDirection, minimumLineSpacing: CGFloat, minimumInteritemSpacing: CGFloat, insetValue: CGFloat, backgroundColor: UIColor) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = scrollDirection
        flowLayout.minimumLineSpacing = minimumLineSpacing
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        flowLayout.sectionInset = UIEdgeInsets(top: insetValue, left: insetValue, bottom: insetValue, right: insetValue)
        self.collectionViewLayout = flowLayout
        self.backgroundColor = backgroundColor
    }

}
