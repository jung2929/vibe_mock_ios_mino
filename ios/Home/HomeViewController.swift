//
//  HomeViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: BaseViewController {


    @IBOutlet weak var TitleCollectionView: UICollectionView!
    @IBOutlet weak var RecommendCollectionView: UICollectionView!
    @IBOutlet weak var RecentlyCollectionView: UICollectionView!
    @IBOutlet weak var HearCollectionView: UICollectionView!
    @IBOutlet weak var NewCollectionView: UICollectionView!
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
        
        var currentIndex: CGFloat = 0
        
        let lineSpacing: CGFloat = 20
        
        let cellRatio: CGFloat = 1
        
        var isOneStepPaging = true
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let TitlenibName = UINib(nibName: "TitleCollectionViewCell", bundle: nil)
            TitleCollectionView.register(TitlenibName, forCellWithReuseIdentifier: "cell")
            let RecommendNibName = UINib(nibName: "RecommendCollectionViewCell", bundle: nil)
            RecommendCollectionView.register(RecommendNibName, forCellWithReuseIdentifier: "cell")
            let RecentlyNibName = UINib(nibName: "RecentlyCollectionViewCell", bundle: nil)
            RecentlyCollectionView.register(RecentlyNibName, forCellWithReuseIdentifier: "cell")
            let HearNibName = UINib(nibName: "HearCollectionViewCell", bundle: nil)
            HearCollectionView.register(HearNibName, forCellWithReuseIdentifier: "cell")
            let NewNibName = UINib(nibName: "NewCollectionViewCell", bundle: nil)
            NewCollectionView.register(NewNibName, forCellWithReuseIdentifier: "cell")
            
            TitleCollectionView.translatesAutoresizingMaskIntoConstraints = false
            RecommendCollectionView.translatesAutoresizingMaskIntoConstraints = false
            RecentlyCollectionView.translatesAutoresizingMaskIntoConstraints = false
            HearCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NewCollectionView.translatesAutoresizingMaskIntoConstraints = false


            // width, height 설정
            let cellWidth = floor(view.frame.width * cellRatio)
            let cellHeight = floor(view.frame.height * cellRatio)

            // 상하, 좌우 inset value 설정
            let insetX = (view.frame.width - cellWidth) / 10
            let insetY = (view.frame.width - cellHeight) / 10
            
            let layout = TitleCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.minimumLineSpacing = lineSpacing
            layout.scrollDirection = .horizontal
            TitleCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
            
            TitleCollectionView.delegate = self
            TitleCollectionView.dataSource = self
            RecommendCollectionView.delegate = self
            RecommendCollectionView.dataSource = self
            RecentlyCollectionView.delegate = self
            RecentlyCollectionView.dataSource = self
            HearCollectionView.delegate = self
            HearCollectionView.dataSource = self
            NewCollectionView.delegate = self
            NewCollectionView.dataSource = self
            
            // 스크롤 시 빠르게 감속 되도록 설정
            TitleCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            RecommendCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            RecentlyCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            HearCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            NewCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast


        }
        
    }

@available(iOS 13.0, *)
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == TitleCollectionView {
                return 1
            }
            if collectionView == RecommendCollectionView {
                return 1
            }
            if collectionView == RecentlyCollectionView {
                return 1
            }
            if collectionView == HearCollectionView {
                return 1
            }
            if collectionView == NewCollectionView {
                return 1
            }
            
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == TitleCollectionView {
                return data.count
            }
            if collectionView == RecommendCollectionView {
                return data.count
            }
            if collectionView == RecentlyCollectionView {
                return data.count
            }
            if collectionView == HearCollectionView {
                return data.count
            }
            if collectionView == NewCollectionView {
                return data.count
            }
            
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if collectionView == TitleCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TitleCollectionViewCell
                cell.titleLabel.text = data[indexPath.row]
                cell.imageView.image = UIImage(named: "titletest")
                cell.backgroundColor = .white
                cell.subTitleLabel.text = data[indexPath.row]
                cell.descriptionLabel.text = data[indexPath.row]
                cell.alpha = 0.5
                return cell
            }
            
            if collectionView == RecommendCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    RecommendCollectionViewCell
                cell.RecommendTitleLabel.text = data[indexPath.row]
                cell.RecommendImageView.image = UIImage(named: "like_test")
                cell.backgroundColor = .white
                cell.RecommendSubTitleLabel.text = data[indexPath.row]
                cell.alpha = 0.5
                return cell
            }
            
            if collectionView == RecentlyCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    RecentlyCollectionViewCell
                cell.RecentlyTitleLabel.text = data[indexPath.row]
                cell.RecentlyImageView.image = UIImage(named: "recently_test2")
                cell.backgroundColor = .white
                cell.RecentlySubTitleLabel.text = data[indexPath.row]
                cell.alpha = 0.5
                cell.sizeToFit()
                return cell
            }
            
            if collectionView == HearCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    HearCollectionViewCell
                cell.HearTitleLabel.text = data[indexPath.row]
                cell.HearImageView.image = UIImage(named: "hear_test2")
                cell.backgroundColor = .white
                cell.HearSubTitleLabel.text = data[indexPath.row]
                cell.alpha = 0.5
                cell.sizeToFit()
                return cell
            }
            
            if collectionView == NewCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    NewCollectionViewCell
                cell.NewTitleLabel.text = data[indexPath.row]
                cell.NewImageView.image = UIImage(named: "new_test2")
                cell.backgroundColor = .white
                cell.NewSubTitleLabel.text = data[indexPath.row]
                cell.alpha = 0.5
                cell.sizeToFit()
                return cell
            }
            return cell
        }
    }

//@available(iOS 13.0, *)
//extension HomeViewController : UIScrollViewDelegate {
//
//        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
//        {
//            // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
//            let layout = self.TitleCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//
//            // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
//            // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
//            var offset = targetContentOffset.pointee
//            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//            var roundedIndex = round(index)
//
//            // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
//            // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
//            // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
//            if scrollView.contentOffset.x > targetContentOffset.pointee.x {
//                roundedIndex = floor(index)
//            } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
//                roundedIndex = ceil(index)
//            } else {
//                roundedIndex = round(index)
//            }
//
//            if isOneStepPaging {
//                if currentIndex > roundedIndex {
//                    currentIndex -= 1
//                    roundedIndex = currentIndex
//                } else if currentIndex < roundedIndex {
//                    currentIndex += 1
//                    roundedIndex = currentIndex
//                }
//            }
//
//            // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
//            offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//            targetContentOffset.pointee = offset
//        }
//    }
