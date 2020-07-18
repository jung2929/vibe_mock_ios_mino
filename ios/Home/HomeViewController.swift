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


    @IBOutlet weak var collectionView: UICollectionView!
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6"]
        
        var currentIndex: CGFloat = 0
        
        let lineSpacing: CGFloat = 20
        
        let cellRatio: CGFloat = 1
        
        var isOneStepPaging = true
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let nibName = UINib(nibName: "TitleCollectionViewCell", bundle: nil)
            collectionView.register(nibName, forCellWithReuseIdentifier: "titlecell")
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            // width, height 설정
            let cellWidth = floor(view.frame.width * cellRatio)
            let cellHeight = floor(view.frame.height * cellRatio)

            // 상하, 좌우 inset value 설정
            let insetX = (view.frame.width - cellWidth) / 10
            let insetY = (view.frame.width - cellHeight) / 10
            
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.minimumLineSpacing = lineSpacing
            layout.scrollDirection = .horizontal
            collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            // 스크롤 시 빠르게 감속 되도록 설정
            collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
        
    }

@available(iOS 13.0, *)
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titlecell", for: indexPath) as! TitleCollectionViewCell
            cell.titleLabel.text = data[indexPath.row]
            cell.imageView.image = UIImage(named: "titletest")
            cell.backgroundColor = .white
            cell.subTitleLabel.text = data[indexPath.row]
            cell.descriptionLabel.text = data[indexPath.row]
            cell.alpha = 0.5
            return cell
        }
        
    }

@available(iOS 13.0, *)
extension HomeViewController : UIScrollViewDelegate {
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
        {
            // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
            let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            
            // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
            // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            var roundedIndex = round(index)
            
            // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
            // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
            // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
            if scrollView.contentOffset.x > targetContentOffset.pointee.x {
                roundedIndex = floor(index)
            } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
                roundedIndex = ceil(index)
            } else {
                roundedIndex = round(index)
            }
            
            if isOneStepPaging {
                if currentIndex > roundedIndex {
                    currentIndex -= 1
                    roundedIndex = currentIndex
                } else if currentIndex < roundedIndex {
                    currentIndex += 1
                    roundedIndex = currentIndex
                }
            }
            
            // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
            offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
            targetContentOffset.pointee = offset
        }
    }
