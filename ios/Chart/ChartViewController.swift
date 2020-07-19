//
//  ChartViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    @IBOutlet weak var TopCollectionView: UICollectionView!
    @IBOutlet weak var LocalCollectionView: UICollectionView!
    @IBOutlet weak var BillboardCollectionView: UICollectionView!
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
    let rankData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
            
        override func viewDidLoad() {
                super.viewDidLoad()
            
                
            let TopibName = UINib(nibName: "Top100CollectionViewCell", bundle: nil)
            TopCollectionView.register(TopibName, forCellWithReuseIdentifier: "cell")
            let LocalibName = UINib(nibName: "LocalCollectionViewCell", bundle: nil)
            LocalCollectionView.register(LocalibName, forCellWithReuseIdentifier: "cell")
            let BillibName = UINib(nibName: "BillboardCollectionViewCell", bundle: nil)
            BillboardCollectionView.register(BillibName, forCellWithReuseIdentifier: "cell")
                
                
            TopCollectionView.translatesAutoresizingMaskIntoConstraints = false
            LocalCollectionView.translatesAutoresizingMaskIntoConstraints = false
            BillboardCollectionView.translatesAutoresizingMaskIntoConstraints = false


            TopCollectionView.delegate = self
            TopCollectionView.dataSource = self
            LocalCollectionView.delegate = self
            LocalCollectionView.dataSource = self
            BillboardCollectionView.delegate = self
            BillboardCollectionView.dataSource = self
                
                
            // 스크롤 시 빠르게 감속 되도록 설정
            TopCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            LocalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            BillboardCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
                
            }
            
        }

extension ChartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
            func numberOfSections(in collectionView: UICollectionView) -> Int {
                if collectionView == TopCollectionView {
                    return 1
                }
                if collectionView == LocalCollectionView {
                    return 1
                }
                if collectionView == BillboardCollectionView {
                    return 1
                }
                
                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                if collectionView == TopCollectionView {
                    return data.count
                }
                if collectionView == LocalCollectionView {
                    return data.count
                }
                if collectionView == BillboardCollectionView {
                    return data.count
                }

                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                if collectionView == TopCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Top100CollectionViewCell
                    cell.TopTitleLabel.text = data[indexPath.row]
                    cell.TopImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.TopSubTitleLabel.text = data[indexPath.row]
                    cell.TopRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == LocalCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalCollectionViewCell
                    cell.LocalTitleLabel.text = data[indexPath.row]
                    cell.LocalImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LocalSubTitleLabel.text = data[indexPath.row]
                    cell.LocalRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == BillboardCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BillboardCollectionViewCell
                    cell.BillTitleLabel.text = data[indexPath.row]
                    cell.BillImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.BillSubTitleLabel.text = data[indexPath.row]
                    cell.BillRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                return cell
        }
}
