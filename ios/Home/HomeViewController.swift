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
    @IBOutlet weak var MagCollectionView: UICollectionView!
    
    let titleData1 = ["#Mood","플레이리스트","플레이리스트"]
    let titleData2: [String] = ["홈_1_1", "홈_1_2", "홈_1_3"]
    let titleData3 = ["라운지바에서", "KB RAPBEAT FESTIVAL", "TV 속 이노래 뭐지?"]
    let titleData4 = ["공간을 채우고 분위기를 바꾸는 재즈 힙합", "페스티벌 전 미리 들어봐야 할 곡들", "많이 검색된 화제의 노래들"]
    
    let recommendData1: [String] = ["홈_3_1", "홈_3_2", "홈_3_3", "홈_3_4"]
    let recommendData2 = ["나른한 그루브", "DOPE!", "깊은 사랑의 감정", "숨은명곡: 국내 알앤비"]
    let recommendData3 = ["VIBE 국내 알앤비/소울", "VIBE 트렌드", "VIBE 발라드", "VIBE 국내 알앤비/소울"]
    
    let recentData1: [String] = ["홈_4_1", "홈_4_2", "홈_4_3", "홈_4_4", "홈_4_5", "홈_4_6", "홈_4_7", "홈_4_8", "홈_4_9", "recently_test2"]
    let recentData2 = ["ROCKSTAR (Feat. Roddy Ricch)", "다시 여기 바닷가", "MARGARITA (Feat. 재규어 중사)", "One More Night", "일기", "내꺼하자", "Mama Told Me", "Physical (Feat. 화사)", "Between Us (Feat. Snoh Aalegra)", "빗소리"]
    let recentData3 = ["DaBaby", "싹쓰리(유두래곤, 린다G, 비룡)", "KIRIN (기린)", "Maroon 5", "박소은", "원어스(ONEUS)", "Alex Newell", "Dua Lipa, 화사(Hwa Sa)", "dvsn", "산들" ]
    
    let hereData1: [String] = ["홈_5_1", "홈_5_2"]
    let hereData2 = ["여름밤의 바이브", "라운지바에서"]
    let hereData3 = ["낭만적인 시티팝 사운드와 함께 깊어가는 여름밤.", "집에서 즐기는 분위기 좋은 라운지 음악."]
    
    let newData1: [String] = ["홈_6_1", "홈_6_2", "홈_6_3", "홈_6_4"]
    let newData2 = ["Muwop", "Simple", "A Muse In Her Feelings", "BAMBOOCLUB[A]"]
    let newData3 = ["Mulatto", "정은지", "dvsn", "릴러말즈"]
    
    let magData1 : [String] = ["홈_7_1", "mag_test2"]
    
    var currentIndex: CGFloat = 0

    let lineSpacing: CGFloat = 10

    let cellRatio: CGFloat = 1

    var isOneStepPaging = true
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // width, height 설정
            let cellWidth = floor(TitleCollectionView.bounds.width * cellRatio)
            let cellHeight = floor(TitleCollectionView.bounds.height * cellRatio)

            // 상하, 좌우 inset value 설정
            let insetX = 0
            let insetY = 0

            let layout = TitleCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.minimumLineSpacing = lineSpacing
            layout.scrollDirection = .horizontal
            TitleCollectionView.contentInset = UIEdgeInsets(top: CGFloat(insetY), left: CGFloat(insetX), bottom: CGFloat(insetY), right: CGFloat(insetX))
            
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
            let MagNibName = UINib(nibName: "MagCollectionViewCell", bundle: nil)
            MagCollectionView.register(MagNibName, forCellWithReuseIdentifier: "cell")
            
            
            
            TitleCollectionView.translatesAutoresizingMaskIntoConstraints = false
            RecommendCollectionView.translatesAutoresizingMaskIntoConstraints = false
            RecentlyCollectionView.translatesAutoresizingMaskIntoConstraints = false
            HearCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NewCollectionView.translatesAutoresizingMaskIntoConstraints = false
            MagCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
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
            MagCollectionView.delegate = self
            MagCollectionView.dataSource = self
            
            // 스크롤 시 빠르게 감속 되도록 설정
            TitleCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            RecommendCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            RecentlyCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            HearCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            NewCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            MagCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
        
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController!.tabBar.barTintColor = .white
        tabBarController!.tabBar.clipsToBounds = true
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
            if collectionView == MagCollectionView {
                return 1
            }
            
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == TitleCollectionView {
                return titleData1.count
            }
            if collectionView == RecommendCollectionView {
                return recommendData1.count
            }
            if collectionView == RecentlyCollectionView {
                return recentData1.count
            }
            if collectionView == HearCollectionView {
                return hereData1.count
            }
            if collectionView == NewCollectionView {
                return newData1.count
            }
            if collectionView == MagCollectionView {
                return magData1.count
            }
            
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if collectionView == TitleCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TitleCollectionViewCell
                cell.titleLabel.text = titleData1[indexPath.row]
                cell.imageView.image = UIImage(named: titleData2[indexPath.row])
                cell.backgroundColor = .white
                cell.subTitleLabel.text = titleData3[indexPath.row]
                cell.descriptionLabel.text = titleData4[indexPath.row]
                return cell
            }
            
            if collectionView == RecommendCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    RecommendCollectionViewCell
                cell.RecommendTitleLabel.text = recommendData2[indexPath.row]
                cell.RecommendImageView.image = UIImage(named: recommendData1[indexPath.row])
                cell.backgroundColor = .white
                cell.RecommendSubTitleLabel.text = recommendData3[indexPath.row]
                return cell
            }
            
            if collectionView == RecentlyCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    RecentlyCollectionViewCell
                cell.RecentlyTitleLabel.text = recentData2[indexPath.row]
                cell.RecentlyImageView.image = UIImage(named: recentData1[indexPath.row])
                cell.backgroundColor = .white
                cell.RecentlySubTitleLabel.text = recentData3[indexPath.row]
                return cell
            }
            
            if collectionView == HearCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    HearCollectionViewCell
                cell.HearTitleLabel.text = hereData2[indexPath.row]
                cell.HearImageView.image = UIImage(named: hereData1[indexPath.row])
                cell.backgroundColor = .white
                cell.HearSubTitleLabel.text = hereData3[indexPath.row]
                return cell
            }
            
            if collectionView == NewCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    NewCollectionViewCell
                cell.NewTitleLabel.text = newData2[indexPath.row]
                cell.NewImageView.image = UIImage(named: newData1[indexPath.row])
                cell.backgroundColor = .white
                cell.NewSubTitleLabel.text = newData3[indexPath.row]
                return cell
            }
            
            if collectionView == MagCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
                    MagCollectionViewCell
                cell.MagImageView.image = UIImage(named: magData1[indexPath.row])
                cell.backgroundColor = .white
                return cell
            }
            return cell
    }

}

@available(iOS 13.0, *)
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == TitleCollectionView {
            let width = TitleCollectionView.bounds.width
            let height = TitleCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        if collectionView == RecommendCollectionView {
            let width = TitleCollectionView.bounds.width * 0.5
            let height = RecommendCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        if collectionView == RecentlyCollectionView {
            let width = RecentlyCollectionView.bounds.width
            let height = RecentlyCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == HearCollectionView {
            let width = TitleCollectionView.bounds.width
            let height = HearCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        if collectionView == NewCollectionView {
            let width = NewCollectionView.bounds.width * 0.5
            let height = NewCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        if collectionView == MagCollectionView {
            let width = TitleCollectionView.bounds.width
            let height = MagCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        
        
            return collectionView.bounds.size
        
    }
}


@available(iOS 13.0, *)
extension HomeViewController : UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
 
        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.TitleCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
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


