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
    @IBOutlet weak var GlobalCollectionView: UICollectionView!
    @IBOutlet weak var LocalHipHopCollectionView: UICollectionView!
    @IBOutlet weak var LocalBaladCollectionView: UICollectionView!
    @IBOutlet weak var MusicVideoCollectionView: UICollectionView!
    @IBOutlet weak var LeagueCollectionView: UICollectionView!
    @IBOutlet weak var SearchCollectionView: UICollectionView!
    @IBOutlet weak var SixYearCollectionView: UICollectionView!
    @IBOutlet weak var NewAlbumCollectionView: UICollectionView!
    
    
    
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
            let GlobalibName = UINib(nibName: "GlobalCollectionViewCell", bundle: nil)
            GlobalCollectionView.register(GlobalibName, forCellWithReuseIdentifier: "cell")
            let LocalHipHoplibName = UINib(nibName: "LocalHipHopCollectionViewCell", bundle: nil)
            LocalHipHopCollectionView.register(LocalHipHoplibName, forCellWithReuseIdentifier: "cell")
            let LocalBaladlibName = UINib(nibName: "LocalBaladCollectionViewCell", bundle: nil)
            LocalBaladCollectionView.register(LocalBaladlibName, forCellWithReuseIdentifier: "cell")
            let MusicVideolibName = UINib(nibName: "MusicVideoCollectionViewCell", bundle: nil)
            MusicVideoCollectionView.register(MusicVideolibName, forCellWithReuseIdentifier: "cell")
            let LeaguelibName = UINib(nibName: "LeagueCollectionViewCell", bundle: nil)
            LeagueCollectionView.register(LeaguelibName, forCellWithReuseIdentifier: "cell")
            let SearchlibName = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
            SearchCollectionView.register(SearchlibName, forCellWithReuseIdentifier: "cell")
            let SixYearlibName = UINib(nibName: "SixYearCollectionViewCell", bundle: nil)
            SixYearCollectionView.register(SixYearlibName, forCellWithReuseIdentifier: "cell")
            let NewAlbumlibName = UINib(nibName: "NewAlbumCollectionViewCell", bundle: nil)
            NewAlbumCollectionView.register(NewAlbumlibName, forCellWithReuseIdentifier: "cell")
                
                
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
                
                if collectionView == GlobalCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GlobalCollectionViewCell
                    cell.GlobalTitleLabel.text = data[indexPath.row]
                    cell.GlobalImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.GlobalSubTitleLabel.text = data[indexPath.row]
                    cell.GlobalRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == LocalHipHopCollectionView {
                                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalHipHopCollectionViewCell
                                   cell.LocalHipHopTitleLabel.text = data[indexPath.row]
                                   cell.LocalHipHopImageView.image = UIImage(named: "recently_test2")
                                   cell.backgroundColor = .white
                                   cell.LocalHipHopSubTitleLabel.text = data[indexPath.row]
                                   cell.LocalHipHopRankLabel.text = rankData[indexPath.row]
                                   cell.alpha = 0.5
                                   cell.sizeToFit()
                                   return cell
                               }
                if collectionView == LocalBaladCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocalBaladCollectionViewCell
                    cell.LocalBaladTitleLabel.text = data[indexPath.row]
                    cell.LocalBaladImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LocalBaladSubTitleLabel.text = data[indexPath.row]
                    cell.LocalBaladRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == MusicVideoCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicVideoCollectionViewCell
                    cell.MusicVideoTitleLabel.text = data[indexPath.row]
                    cell.MusicVideoImageView.image = UIImage(named: "musicvideo_test2")
                    cell.backgroundColor = .white
                    cell.MusicVideoSubTitleLabel.text = data[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == LeagueCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueCollectionViewCell
                    cell.LeagueTitleLabel.text = data[indexPath.row]
                    cell.LeagueImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.LeagueSubTitleLabel.text = data[indexPath.row]
                    cell.LeagueRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == SearchCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
                    cell.SearchTitleLabel.text = data[indexPath.row]
                    cell.SearchImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.SearchSubTitleLabel.text = data[indexPath.row]
                    cell.SearchRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == SixYearCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SixYearCollectionViewCell
                    cell.SixYearTitleLabel.text = data[indexPath.row]
                    cell.SixYearImageView.image = UIImage(named: "recently_test2")
                    cell.backgroundColor = .white
                    cell.SixYearSubTitleLabel.text = data[indexPath.row]
                    cell.SixYearRankLabel.text = rankData[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                
                if collectionView == NewAlbumCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewAlbumCollectionViewCell
                    cell.NewAlbumTitleLabel.text = data[indexPath.row]
                    cell.NewAlbumImageView.image = UIImage(named: "like_test")
                    cell.backgroundColor = .white
                    cell.NewAlbumSubTitleLabel.text = data[indexPath.row]
                    cell.alpha = 0.5
                    cell.sizeToFit()
                    return cell
                }
                return cell
        }
}
