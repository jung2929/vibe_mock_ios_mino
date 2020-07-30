//
//  ChartViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Kingfisher

@available(iOS 13.0, *)
class ChartViewController: UIViewController {

    @IBOutlet weak var TopCollectionView: UICollectionView!
    @IBOutlet weak var LocalCollectionView: UICollectionView!
    @IBOutlet weak var BillboardCollectionView: UICollectionView!
    @IBOutlet weak var GlobalCollectionView: UICollectionView!
    @IBOutlet weak var LocalHipHopCollectionView: UICollectionView!
    @IBOutlet weak var LocalBaladCollectionView: UICollectionView!
    @IBOutlet weak var MusicVideoCollectionView: UICollectionView!
    @IBOutlet weak var LeagueCollectionView: UICollectionView!
    @IBOutlet weak var SearchCollectionView: UICollectionView!
    @IBOutlet weak var SixYearCollectionView: UICollectionView!
    @IBOutlet weak var NewAlbumCollectionView: UICollectionView!
    @IBAction func top100MoreButton(_ sender: Any) {
        let chartDetailVC = ChartDetailViewController()
        self.navigationController?.pushViewController(chartDetailVC, animated:
        true)
    }
    @IBAction func newAlbumMoreButton(_ sender: Any) {
        let albumDetailVC = NewAlbumDetailViewController()
        self.navigationController?.pushViewController(albumDetailVC, animated:
        true)
    }
    @IBOutlet weak var topDate: UILabel!
    @IBOutlet weak var localDate: UILabel!
    @IBOutlet weak var billboardDate: UILabel!
    @IBOutlet weak var globalDate: UILabel!
   
    var currentIndex: CGFloat = 0

    let lineSpacing: CGFloat = 10

    let cellRatio: CGFloat = 1

    var isOneStepPaging = true
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
    let rankData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    let recentData1: [String] = ["홈_4_1", "홈_4_2", "홈_4_3", "홈_4_4", "홈_4_5", "홈_4_6", "홈_4_7", "홈_4_8", "홈_4_9", "recently_test2"]
    let recentData2 = ["ROCKSTAR (Feat. Roddy Ricch)", "다시 여기 바닷가", "MARGARITA (Feat. 재규어 중사)", "One More Night", "일기", "내꺼하자", "Mama Told Me", "Physical (Feat. 화사)", "Between Us (Feat. Snoh Aalegra)", "빗소리"]
    let recentData3 = ["DaBaby", "싹쓰리(유두래곤, 린다G, 비룡)", "KIRIN (기린)", "Maroon 5", "박소은", "원어스(ONEUS)", "Alex Newell", "Dua Lipa, 화사(Hwa Sa)", "dvsn", "산들" ]
    let musicVideo1: [String] = ["차트1_1", "차트1_2", "musicvideo_test2"]
    let musicVideo2 = ["다시 여기 바닷가", "눈누난나 (NUNU NANA)", "여름 안에서 (Covered By 싹쓰리)"]
    let musicVideo3 = ["싹쓰리(유두래곤, 린다G, 비룡)", "제시(Jessi)", "싹쓰리(유두래곤, 린다G, 비룡)"]
    let newData1: [String] = ["홈_6_1", "홈_6_2", "홈_6_3", "홈_6_4"]
    let newData2 = ["Muwop", "Simple", "A Muse In Her Feelings", "BAMBOOCLUB[A]"]
    let newData3 = ["Mulatto", "정은지", "dvsn", "릴러말즈"]
    
    var topChart:[Music] = []
    var localChart:[localMusic] = []
    var billboardChart:[billboardMusic] = []
    var globalChart: [globalMusic] = []
//    var imageUrl: URL?
            
        override func viewDidLoad() {
                super.viewDidLoad()
            
            // width, height 설정
            let cellWidth = floor(TopCollectionView.bounds.width * cellRatio)
            let cellHeight = floor(TopCollectionView.bounds.height * cellRatio)

            // 상하, 좌우 inset value 설정
            let insetX = 0
            let insetY = 0

            let layout = TopCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.minimumLineSpacing = lineSpacing
            layout.scrollDirection = .horizontal
            TopCollectionView.contentInset = UIEdgeInsets(top: CGFloat(insetY), left: CGFloat(insetX), bottom: CGFloat(insetY), right: CGFloat(insetX))
            
                
            let TopNibName = UINib(nibName: "Top100CollectionViewCell", bundle: nil)
            TopCollectionView.register(TopNibName, forCellWithReuseIdentifier: "cell")
            let LocalNibName = UINib(nibName: "LocalCollectionViewCell", bundle: nil)
            LocalCollectionView.register(LocalNibName, forCellWithReuseIdentifier: "cell")
            let BillNibName = UINib(nibName: "BillboardCollectionViewCell", bundle: nil)
            BillboardCollectionView.register(BillNibName, forCellWithReuseIdentifier: "cell")
            let GlobalNibName = UINib(nibName: "GlobalCollectionViewCell", bundle: nil)
            GlobalCollectionView.register(GlobalNibName, forCellWithReuseIdentifier: "cell")
            let LocalHipHopNibName = UINib(nibName: "LocalHipHopCollectionViewCell", bundle: nil)
            LocalHipHopCollectionView.register(LocalHipHopNibName, forCellWithReuseIdentifier: "cell")
            let LocalBaladNibName = UINib(nibName: "LocalBaladCollectionViewCell", bundle: nil)
            LocalBaladCollectionView.register(LocalBaladNibName, forCellWithReuseIdentifier: "cell")
            let MusicVideoNibName = UINib(nibName: "MusicVideoCollectionViewCell", bundle: nil)
            MusicVideoCollectionView.register(MusicVideoNibName, forCellWithReuseIdentifier: "cell")
            let LeagueNibName = UINib(nibName: "LeagueCollectionViewCell", bundle: nil)
            LeagueCollectionView.register(LeagueNibName, forCellWithReuseIdentifier: "cell")
            let SearchNibName = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
            SearchCollectionView.register(SearchNibName, forCellWithReuseIdentifier: "cell")
            let SixYearNibName = UINib(nibName: "SixYearCollectionViewCell", bundle: nil)
            SixYearCollectionView.register(SixYearNibName, forCellWithReuseIdentifier: "cell")
            let NewAlbumNibName = UINib(nibName: "NewAlbumCollectionViewCell", bundle: nil)
            NewAlbumCollectionView.register(NewAlbumNibName, forCellWithReuseIdentifier: "cell")
                
                
            TopCollectionView.translatesAutoresizingMaskIntoConstraints = false
            LocalCollectionView.translatesAutoresizingMaskIntoConstraints = false
            BillboardCollectionView.translatesAutoresizingMaskIntoConstraints = false
            GlobalCollectionView.translatesAutoresizingMaskIntoConstraints = false
            LocalHipHopCollectionView.translatesAutoresizingMaskIntoConstraints = false
            LocalBaladCollectionView.translatesAutoresizingMaskIntoConstraints = false
            MusicVideoCollectionView.translatesAutoresizingMaskIntoConstraints = false
            LeagueCollectionView.translatesAutoresizingMaskIntoConstraints = false
            SearchCollectionView.translatesAutoresizingMaskIntoConstraints = false
            SixYearCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NewAlbumCollectionView.translatesAutoresizingMaskIntoConstraints = false


            TopCollectionView.delegate = self
            TopCollectionView.dataSource = self
            LocalCollectionView.delegate = self
            LocalCollectionView.dataSource = self
            BillboardCollectionView.delegate = self
            BillboardCollectionView.dataSource = self
            GlobalCollectionView.delegate = self
            GlobalCollectionView.dataSource = self
            LocalHipHopCollectionView.delegate = self
            LocalHipHopCollectionView.dataSource = self
            LocalBaladCollectionView.delegate = self
            LocalBaladCollectionView.dataSource = self
            MusicVideoCollectionView.delegate = self
            MusicVideoCollectionView.dataSource = self
            LeagueCollectionView.delegate = self
            LeagueCollectionView.dataSource = self
            SearchCollectionView.delegate = self
            SearchCollectionView.dataSource = self
            SixYearCollectionView.delegate = self
            SixYearCollectionView.dataSource = self
            NewAlbumCollectionView.delegate = self
            NewAlbumCollectionView.dataSource = self
                
                
            // 스크롤 시 빠르게 감속 되도록 설정
            TopCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            LocalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            BillboardCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            GlobalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            LocalHipHopCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            LocalBaladCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            MusicVideoCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            LeagueCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            SearchCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            SixYearCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            NewAlbumCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            
            
            }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController!.tabBar.barTintColor = .white
        tabBarController!.tabBar.clipsToBounds = true
        ChartDataManager().getChart(self)
        ChartDataManager().getLocalChart(self)
        ChartDataManager().getBillboardChart(self)
        ChartDataManager().getGlobalChart(self)

        
    }
            
        }

@available(iOS 13.0, *)
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
                if collectionView == GlobalCollectionView {
                    return 1
                }
                if collectionView == LocalHipHopCollectionView {
                    return 1
                }
                if collectionView == LocalBaladCollectionView {
                    return 1
                }
                if collectionView == MusicVideoCollectionView {
                    return 1
                }
                if collectionView == LeagueCollectionView {
                    return 1
                }
                if collectionView == SearchCollectionView {
                    return 1
                }
                if collectionView == SixYearCollectionView {
                    return 1
                }
                if collectionView == NewAlbumCollectionView {
                    return 1
                }
                
                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                if collectionView == TopCollectionView {
                    return topChart.count
                }
                if collectionView == LocalCollectionView {
                    return localChart.count
                }
                if collectionView == BillboardCollectionView {
                    return billboardChart.count
                }
                if collectionView == GlobalCollectionView {
                    return globalChart.count
                }
                if collectionView == LocalHipHopCollectionView {
                    return recentData1.count
                }
                if collectionView == LocalBaladCollectionView {
                    return recentData1.count
                }
                if collectionView == MusicVideoCollectionView {
                    return musicVideo1.count
                }
                if collectionView == LeagueCollectionView {
                    return recentData1.count
                }
                if collectionView == SearchCollectionView {
                    return recentData1.count
                }
                if collectionView == SixYearCollectionView {
                    return recentData1.count
                }
                if collectionView == NewAlbumCollectionView {
                    return newData1.count
                }

                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                if collectionView == TopCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Top100CollectionViewCell
                    cell.TopTitleLabel.text = topChart[indexPath.row].musicName
                    cell.TopImageView.image = UIImage(named: "recently_test2")
//                    cell.TopImageView.kf.setImage(with: imageUrl)
                    cell.backgroundColor = .white
                    cell.TopSubTitleLabel.text = topChart[indexPath.row].artistName
                    cell.TopRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == LocalCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalCollectionViewCell
                    cell.LocalTitleLabel.text = localChart[indexPath.row].musicName
                    cell.LocalImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LocalSubTitleLabel.text = localChart[indexPath.row].artistName
                    cell.LocalRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == BillboardCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BillboardCollectionViewCell
                    cell.BillTitleLabel.text = billboardChart[indexPath.row].musicName
                    cell.BillImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.BillSubTitleLabel.text = billboardChart[indexPath.row].artistName
                    cell.BillRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == GlobalCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GlobalCollectionViewCell
                    cell.GlobalTitleLabel.text = globalChart[indexPath.row].musicName
                    cell.GlobalImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.GlobalSubTitleLabel.text = globalChart[indexPath.row].artistName
                    cell.GlobalRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == LocalHipHopCollectionView {
                                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalHipHopCollectionViewCell
                                   cell.LocalHipHopTitleLabel.text = recentData2[indexPath.row]
                    cell.LocalHipHopImageView.image = UIImage(named: recentData1[indexPath.row])
                                   cell.backgroundColor = .white
                                   cell.LocalHipHopSubTitleLabel.text = recentData3[indexPath.row]
                                   cell.LocalHipHopRankLabel.text = rankData[indexPath.row]
                                   return cell
                               }
                if collectionView == LocalBaladCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalBaladCollectionViewCell
                    cell.LocalBaladTitleLabel.text = recentData2[indexPath.row]
                    cell.LocalBaladImageView.image = UIImage(named: recentData1[indexPath.row])
                    cell.backgroundColor = .white
                    cell.LocalBaladSubTitleLabel.text = recentData3[indexPath.row]
                    cell.LocalBaladRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == MusicVideoCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicVideoCollectionViewCell
                    cell.MusicVideoTitleLabel.text = musicVideo2[indexPath.row]
                    cell.MusicVideoImageView.image = UIImage(named: musicVideo1[indexPath.row])
                    cell.backgroundColor = .white
                    cell.MusicVideoSubTitleLabel.text = musicVideo3[indexPath.row]
                    return cell
                }
                
                if collectionView == LeagueCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueCollectionViewCell
                    cell.LeagueTitleLabel.text = recentData2[indexPath.row]
                    cell.LeagueImageView.image = UIImage(named: recentData1[indexPath.row])
                    cell.backgroundColor = .white
                    cell.LeagueSubTitleLabel.text = recentData3[indexPath.row]
                    cell.LeagueRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == SearchCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
                    cell.SearchTitleLabel.text = recentData2[indexPath.row]
                    cell.SearchImageView.image = UIImage(named: recentData1[indexPath.row])
                    cell.backgroundColor = .white
                    cell.SearchSubTitleLabel.text = recentData3[indexPath.row]
                    cell.SearchRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == SixYearCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SixYearCollectionViewCell
                    cell.SixYearTitleLabel.text = recentData2[indexPath.row]
                    cell.SixYearImageView.image = UIImage(named: recentData1[indexPath.row])
                    cell.backgroundColor = .white
                    cell.SixYearSubTitleLabel.text = recentData3[indexPath.row]
                    cell.SixYearRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == NewAlbumCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewAlbumCollectionViewCell
                    cell.NewAlbumTitleLabel.text = newData2[indexPath.row]
                    cell.NewAlbumImageView.image = UIImage(named: newData1[indexPath.row])
                    cell.backgroundColor = .white
                    cell.NewAlbumSubTitleLabel.text = newData3[indexPath.row]
                    return cell
                }
                return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let detailVC = ChartDetailViewController()
//            self.navigationController?.pushViewController(detailVC, animated: true)
            
    }
    
}

@available(iOS 13.0, *)
extension ChartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == TopCollectionView {
            let width = TopCollectionView.bounds.width
            let height = TopCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == LocalCollectionView {
            let width = LocalCollectionView.bounds.width
            let height = LocalCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == BillboardCollectionView {
            let width = BillboardCollectionView.bounds.width
            let height = BillboardCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == GlobalCollectionView {
            let width = GlobalCollectionView.bounds.width
            let height = GlobalCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == LocalHipHopCollectionView {
            let width = LocalHipHopCollectionView.bounds.width
            let height = LocalHipHopCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == LocalBaladCollectionView {
            let width = LocalBaladCollectionView.bounds.width
            let height = LocalBaladCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == LeagueCollectionView {
            let width = LeagueCollectionView.bounds.width
            let height = LeagueCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == SearchCollectionView {
            let width = SearchCollectionView.bounds.width
            let height = SearchCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == SixYearCollectionView {
            let width = SixYearCollectionView.bounds.width
            let height = SixYearCollectionView.bounds.height * 0.17
            return CGSize(width: width, height: height)
        }
        if collectionView == NewAlbumCollectionView {
            let width = NewAlbumCollectionView.bounds.width * 0.5
            let height = NewAlbumCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        if collectionView == MusicVideoCollectionView {
            let width = MusicVideoCollectionView.bounds.width * 0.75
            let height = MusicVideoCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        return collectionView.bounds.size
    }
}

@available(iOS 13.0, *)
extension ChartViewController : UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {

        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.TopCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
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
