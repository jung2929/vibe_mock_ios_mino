//
//  SongViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SongViewController: BaseViewController {
    
    @IBOutlet weak var SongCollectionView: UICollectionView!
    @IBAction func playButton(_ sender: Any) {
        print("play")
    }
    @IBAction func shuffleButton(_ sender: Any) {
        print("shuffle")
    }
    
    
    
    let recentData1: [String] = ["홈_4_1", "홈_4_2", "홈_4_3", "홈_4_4", "홈_4_5", "홈_4_6", "홈_4_7", "홈_4_8", "홈_4_9", "recently_test2"]
    let recentData2 = ["ROCKSTAR (Feat. Roddy Ricch)", "다시 여기 바닷가", "MARGARITA (Feat. 재규어 중사)", "One More Night", "일기", "내꺼하자", "Mama Told Me", "Physical (Feat. 화사)", "Between Us (Feat. Snoh Aalegra)", "빗소리"]
    let recentData3 = ["DaBaby", "싹쓰리(유두래곤, 린다G, 비룡)", "KIRIN (기린)", "Maroon 5", "박소은", "원어스(ONEUS)", "Alex Newell", "Dua Lipa, 화사(Hwa Sa)", "dvsn", "산들" ]
                        
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        let SongNibName = UINib(nibName: "SongCollectionViewCell", bundle: nil)
        SongCollectionView.register(SongNibName, forCellWithReuseIdentifier: "cell")

        SongCollectionView.translatesAutoresizingMaskIntoConstraints = false

        SongCollectionView.delegate = self
        SongCollectionView.dataSource = self
           
        // 스크롤 시 빠르게 감속 되도록 설정
        }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
extension SongViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == SongCollectionView {
                return 1
            }
                return 0
}
                    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SongCollectionView {
            return recentData3.count
        }
            return 0
}
                    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    if collectionView == SongCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongCollectionViewCell
            cell.SongTitleLabel.text = recentData2[indexPath.row]
        cell.SongImageView.image = UIImage(named: recentData1[indexPath.row])
            cell.SongSubTitleLabel.text = recentData3[indexPath.row]
            cell.backgroundColor = .white
            return cell
        }
            return cell
        }
}

extension SongViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == SongCollectionView {
            let width = SongCollectionView.bounds.width
            let height = SongCollectionView.bounds.height * 0.1
            return CGSize(width: width, height: height)
        }
       
        return collectionView.bounds.size
    }
}
