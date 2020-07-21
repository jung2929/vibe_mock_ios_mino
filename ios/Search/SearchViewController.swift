//
//  SearchViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {


    @IBOutlet weak var NewsCollectionView: UICollectionView!
    
    
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
        var recentData = [""]
                    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
                        
        let NewsNibName = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        NewsCollectionView.register(NewsNibName, forCellWithReuseIdentifier: "cell")

        NewsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NewsCollectionView.delegate = self
        NewsCollectionView.dataSource = self
           
        // 스크롤 시 빠르게 감속 되도록 설정
        NewsCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == NewsCollectionView {
                return 1
            }
                return 0
}
                    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == NewsCollectionView {
            return data.count
        }
            return 0
}
                    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    if collectionView == NewsCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCollectionViewCell
            cell.NewsTitleLabel.text = data[indexPath.row]
            cell.NewsImageView.image = UIImage(named: "search_test")
            cell.backgroundColor = .white
            cell.alpha = 0.5
            cell.sizeToFit()
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.2
            return cell
        }
            return cell
        }
}

