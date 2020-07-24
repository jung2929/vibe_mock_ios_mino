//
//  SongViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class SongViewController: UIViewController {
    
    @IBOutlet weak var SongCollectionView: UICollectionView!
    @IBAction func playButton(_ sender: Any) {
        print("play")
    }
    @IBAction func shuffleButton(_ sender: Any) {
        print("shuffle")
    }
    
    let data = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
                    
    var pageScroll:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        pageScroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.layer.bounds.width, height: self.view.layer.bounds.height + 40))
        
        self.view.addSubview(pageScroll)
        pageScroll.addSubview(SongCollectionView)
                        
        let SongNibName = UINib(nibName: "SongCollectionViewCell", bundle: nil)
        SongCollectionView.register(SongNibName, forCellWithReuseIdentifier: "cell")

        SongCollectionView.translatesAutoresizingMaskIntoConstraints = false

        SongCollectionView.delegate = self
        SongCollectionView.dataSource = self
           
        // 스크롤 시 빠르게 감속 되도록 설정
        }
}
@available(iOS 13.0, *)
extension SongViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == SongCollectionView {
                return 1
            }
                return 0
}
                    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SongCollectionView {
            return data.count
        }
            return 0
}
                    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    if collectionView == SongCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongCollectionViewCell
            cell.SongTitleLabel.text = data[indexPath.row]
            cell.SongImageView.image = UIImage(named: "recently_test2")
            cell.SongSubTitleLabel.text = data[indexPath.row]
            cell.backgroundColor = .white
            return cell
        }
            return cell
        }
}

@available(iOS 13.0, *)
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
