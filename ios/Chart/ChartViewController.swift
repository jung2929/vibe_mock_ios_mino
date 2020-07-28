//
//  ChartViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
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
    
    
    
    var currentIndex: CGFloat = 0

    let lineSpacing: CGFloat = 10

    let cellRatio: CGFloat = 1

    var isOneStepPaging = true
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
    let rankData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
            
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
                    return data.count
                }
                if collectionView == LocalCollectionView {
                    return data.count
                }
                if collectionView == BillboardCollectionView {
                    return data.count
                }
                if collectionView == GlobalCollectionView {
                    return data.count
                }
                if collectionView == LocalHipHopCollectionView {
                    return data.count
                }
                if collectionView == LocalBaladCollectionView {
                    return data.count
                }
                if collectionView == MusicVideoCollectionView {
                    return data.count
                }
                if collectionView == LeagueCollectionView {
                    return data.count
                }
                if collectionView == SearchCollectionView {
                    return data.count
                }
                if collectionView == SixYearCollectionView {
                    return data.count
                }
                if collectionView == NewAlbumCollectionView {
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
                    return cell
                }
                
                if collectionView == LocalCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalCollectionViewCell
                    cell.LocalTitleLabel.text = data[indexPath.row]
                    cell.LocalImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LocalSubTitleLabel.text = data[indexPath.row]
                    cell.LocalRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == BillboardCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BillboardCollectionViewCell
                    cell.BillTitleLabel.text = data[indexPath.row]
                    cell.BillImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.BillSubTitleLabel.text = data[indexPath.row]
                    cell.BillRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == GlobalCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GlobalCollectionViewCell
                    cell.GlobalTitleLabel.text = data[indexPath.row]
                    cell.GlobalImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.GlobalSubTitleLabel.text = data[indexPath.row]
                    cell.GlobalRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == LocalHipHopCollectionView {
                                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalHipHopCollectionViewCell
                                   cell.LocalHipHopTitleLabel.text = data[indexPath.row]
                                   cell.LocalHipHopImageView.image = UIImage(named: "recently_test2")
                                   cell.backgroundColor = .white
                                   cell.LocalHipHopSubTitleLabel.text = data[indexPath.row]
                                   cell.LocalHipHopRankLabel.text = rankData[indexPath.row]
                                   return cell
                               }
                if collectionView == LocalBaladCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalBaladCollectionViewCell
                    cell.LocalBaladTitleLabel.text = data[indexPath.row]
                    cell.LocalBaladImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LocalBaladSubTitleLabel.text = data[indexPath.row]
                    cell.LocalBaladRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == MusicVideoCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicVideoCollectionViewCell
                    cell.MusicVideoTitleLabel.text = data[indexPath.row]
                    cell.MusicVideoImageView.image = UIImage(named: "musicvideo_test2")
                    cell.backgroundColor = .white
                    cell.MusicVideoSubTitleLabel.text = data[indexPath.row]
                    return cell
                }
                
                if collectionView == LeagueCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueCollectionViewCell
                    cell.LeagueTitleLabel.text = data[indexPath.row]
                    cell.LeagueImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LeagueSubTitleLabel.text = data[indexPath.row]
                    cell.LeagueRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == SearchCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
                    cell.SearchTitleLabel.text = data[indexPath.row]
                    cell.SearchImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.SearchSubTitleLabel.text = data[indexPath.row]
                    cell.SearchRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == SixYearCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SixYearCollectionViewCell
                    cell.SixYearTitleLabel.text = data[indexPath.row]
                    cell.SixYearImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.SixYearSubTitleLabel.text = data[indexPath.row]
                    cell.SixYearRankLabel.text = rankData[indexPath.row]
                    return cell
                }
                
                if collectionView == NewAlbumCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewAlbumCollectionViewCell
                    cell.NewAlbumTitleLabel.text = data[indexPath.row]
                    cell.NewAlbumImageView.image = UIImage(named: "like_test")
                    cell.backgroundColor = .white
                    cell.NewAlbumSubTitleLabel.text = data[indexPath.row]
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
