//
//  DJViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class DJViewController: UIViewController {
    
    
    @IBOutlet weak var DJRecentlyCollectionView: UICollectionView!

    @IBAction func addRecently(_ sender: Any) {
        recentData.insert(contentsOf: [""], at: 0)
        DJRecentlyCollectionView.reloadData()
    }
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
    var recentData = [""]
                
            override func viewDidLoad() {
                    super.viewDidLoad()
                
                    
                let DJRecentlyNibName = UINib(nibName: "DJRecentlyCollectionViewCell", bundle: nil)
                DJRecentlyCollectionView.register(DJRecentlyNibName, forCellWithReuseIdentifier: "cell")

                DJRecentlyCollectionView.translatesAutoresizingMaskIntoConstraints = false

                DJRecentlyCollectionView.delegate = self
                DJRecentlyCollectionView.dataSource = self
   
                // 스크롤 시 빠르게 감속 되도록 설정
                DJRecentlyCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
}
@available(iOS 13.0, *)
extension DJViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == DJRecentlyCollectionView {
                return 1
            }
            return 0
}
                
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == DJRecentlyCollectionView {
            return recentData.count
        }
            return 0
}
                
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    if collectionView == DJRecentlyCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DJRecentlyCollectionViewCell
            cell.DJRecentlyImageView.image = UIImage(named: "DJ_test")
            cell.backgroundColor = .white
            cell.alpha = 0.5
            cell.sizeToFit()
            return cell
        }
            return cell
        }
}

@available(iOS 13.0, *)
extension DJViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == DJRecentlyCollectionView {
            let width = DJRecentlyCollectionView.bounds.width * 0.5
            let height = DJRecentlyCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
       
        return collectionView.bounds.size
    }
}
