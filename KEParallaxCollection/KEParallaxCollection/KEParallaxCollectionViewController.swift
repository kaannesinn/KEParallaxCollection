//
//  ViewController.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 24.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

protocol KEParallaxCollectionViewControllerDelegate: NSObject {
    func cellDidSelect(item: (color: UIColor, title: String, price: CGFloat, discountedPrice: CGFloat?), indexPath: IndexPath)
}

class KEParallaxCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, KEParallaxCellDelegate {

    @IBOutlet weak var collectionView: KEStoryLikeCollectionView!
    var itemArray: [(color: UIColor, title: String, price: CGFloat, discountedPrice: CGFloat?)]?
    var insetValue: CGFloat = 0.0
    var cellWidth: CGFloat = 370.0
    var cellHeight: CGFloat = 240.0
    var minimumLineSpacing: CGFloat = 5.0
    var minimumInteritemSpacing: CGFloat = 5.0
    var isImageRoundedOnCell: Bool = true
    var cornerRadiusForImageOnCell: CGFloat = 20.0
    var backgroundColor: UIColor = .lightGray
    var scrollDirection: UICollectionView.ScrollDirection = .horizontal
    var delegate: KEParallaxCollectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.prepareFlowLayout(cellWidth: cellWidth, cellHeight: cellHeight, scrollDirection: scrollDirection, minimumLineSpacing: minimumLineSpacing, minimumInteritemSpacing: minimumInteritemSpacing, insetValue: insetValue, backgroundColor: backgroundColor)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KEParallaxCell", for: indexPath) as! KEParallaxCell
        cell.backgroundColor = .gray
        if let item = itemArray?[indexPath.row] {
            cell.lblTitle.text = item.title
            cell.lblPrice.text = "\(item.price) ₺"
            cell.lblDiscountedPrice.isHidden = true
            if let disPrice = item.discountedPrice {
                cell.lblDiscountedPrice.text = "\(disPrice) ₺"
                cell.lblDiscountedPrice.isHidden = false
            }
            cell.imgCell.backgroundColor = item.color
            cell.updateCellImage(isImageRounded: isImageRoundedOnCell, cornerRadius: cornerRadiusForImageOnCell)
            cell.delegate = self
            cell.tag = indexPath.row
            cell.btnOnCell.tag = indexPath.row
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = itemArray?[indexPath.row] {
            delegate?.cellDidSelect(item: item, indexPath: indexPath)
        }
    }
    
    func btnSelected(sender: UIButton) {
        if let item = itemArray?[sender.tag] {
            delegate?.cellDidSelect(item: item, indexPath: IndexPath(row: sender.tag, section: 0))
        }
    }
}
