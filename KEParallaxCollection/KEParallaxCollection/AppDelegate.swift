//
//  AppDelegate.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 26.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, KEParallaxCollectionViewControllerDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KEParallaxCollectionViewController") as? KEParallaxCollectionViewController {
            vc.delegate = self
            vc.itemArray = [(color: UIColor.lightGray, title: "1 sdfasdf", price: 400.0, discountedPrice: 200.0),
                            (color: UIColor.yellow, title: "2 asdklfj asdfjk", price: 1400.0, discountedPrice: 1200.0),
                            (color: UIColor.green, title: "3 a23r", price: 43000.0, discountedPrice: 42000.0),
                            (color: UIColor.darkGray, title: "4 askdlfjlkajsdflkj", price: 123.5, discountedPrice: nil),
                            (color: UIColor.black, title: "5 sdfj", price: 1499.99, discountedPrice: 1299.99),
                            (color: UIColor.orange, title: "6 aşosdfkjv pwdfı", price: 22.0, discountedPrice: 20.0),
                            (color: UIColor.magenta, title: "7 dsnvm", price: 213.0, discountedPrice: 200.0),
                            (color: UIColor.purple, title: "8 230r9fjv sodfpoısdpfsdf", price: 1.0, discountedPrice: nil),
                            (color: UIColor.blue, title: "9 sakdf", price: 23.99, discountedPrice: 20.0),
                            (color: UIColor.cyan, title: "10 sdfasdf sdfasdf", price: 19999.99, discountedPrice: 17999.99)]
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        window?.makeKeyAndVisible()
        return true
    }

    func cellDidSelect(item: (color: UIColor, title: String, price: CGFloat, discountedPrice: CGFloat?), indexPath: IndexPath, cell: KEParallaxCell?) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            if let navc = window?.rootViewController as? UINavigationController {
                vc.loadView()
                vc.imgView.backgroundColor = item.color

                let embeddingView = UIView(frame: vc.imgView.frame)
                embeddingView.backgroundColor = UIColor.clear
                embeddingView.clipsToBounds = true
                embeddingView.layer.cornerRadius = 20.0
                embeddingView.layer.masksToBounds = true
                let imgView = UIImageView(image: cell?.imgCell.image)
                imgView.backgroundColor = item.color
                let rect = UIApplication.shared.delegate?.window!!.convert(cell!.imgCell.frame, from: cell?.contentView)
//                let rect = cell?.contentView.convert(cell!.imgCell.frame, to: UIApplication.shared.delegate?.window!)
                imgView.frame = rect!
                imgView.layer.cornerRadius = 20.0
                imgView.layer.masksToBounds = true
                embeddingView.addSubview(imgView)
                UIApplication.shared.delegate?.window??.addSubview(embeddingView)
                
                UIView.animate(withDuration: 0.25, delay: 0, options: [.allowAnimatedContent, .allowUserInteraction], animations: {
                    imgView.frame = vc.imgView.frame
                }, completion: nil)

                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .crossDissolve
                navc.present(vc, animated: true) {
                    embeddingView.removeFromSuperview()
                }
            }
        }
    }
    
    func allClicked() {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            if let navc = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController {
                navc.present(vc, animated: true, completion: nil)
            }
        }
    }
}

