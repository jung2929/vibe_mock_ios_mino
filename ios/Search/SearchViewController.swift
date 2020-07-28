//
//  SearchViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit

@available(iOS 13.0, *)
class SearchViewController: UIViewController {


    @IBOutlet weak var NewsCollectionView: UICollectionView!
    
    @IBAction func firstButton(_ sender: Any) {
        
    }
    
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
        var recentData = [""]
    
    var currentIndex: CGFloat = 0

    let lineSpacing: CGFloat = 10

    let cellRatio: CGFloat = 1

    var isOneStepPaging = true
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // width, height 설정
        let cellWidth = floor(NewsCollectionView.bounds.width * cellRatio)
        let cellHeight = floor(NewsCollectionView.bounds.height * cellRatio)

        // 상하, 좌우 inset value 설정
        let insetX = 0
        let insetY = 0

        let layout = NewsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = lineSpacing
        layout.scrollDirection = .horizontal
        NewsCollectionView.contentInset = UIEdgeInsets(top: CGFloat(insetY), left: CGFloat(insetX), bottom: CGFloat(insetY), right: CGFloat(insetX))
                    
                        
        let NewsNibName = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        NewsCollectionView.register(NewsNibName, forCellWithReuseIdentifier: "cell")

        NewsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NewsCollectionView.delegate = self
        NewsCollectionView.dataSource = self
           
        // 스크롤 시 빠르게 감속 되도록 설정
        NewsCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController!.tabBar.barTintColor = .white
        tabBarController!.tabBar.clipsToBounds = true
    }
}
@available(iOS 13.0, *)
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
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.2
            return cell
        }
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newsDetailViewController = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        self.present(newsDetailViewController, animated: true, completion: nil)
    }
}

@available(iOS 13.0, *)
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == NewsCollectionView {
            let width = NewsCollectionView.bounds.width
            let height = NewsCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
       
        return collectionView.bounds.size
    }
}

@available(iOS 13.0, *)
extension SearchViewController : UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
 
        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.NewsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
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
