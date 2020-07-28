//
//  NewAlbumViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class NewAlbumDetailViewController: UIViewController {

    
    @IBOutlet weak var NewAlbumDetailCollectionView: UICollectionView!
    
    
    var data:[String] = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10", "test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()

            navigationController?.setNavigationBarHidden(false, animated: true)
            navigationController?.navigationBar.backgroundColor = .white
            self.navigationController?.navigationBar.topItem?.title = "최신 앨범"

            
            NewAlbumDetailCollectionView.delegate = self
            NewAlbumDetailCollectionView.dataSource = self
            
            let nibName = UINib(nibName: "NewAlbumDetailCollectionViewCell", bundle: nil)
            NewAlbumDetailCollectionView.register(nibName, forCellWithReuseIdentifier: "cell")

        }

    }

@available(iOS 13.0, *)
extension NewAlbumDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            if collectionView == NewAlbumDetailCollectionView {
                return 1
            }
                return 0
}
                    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == NewAlbumDetailCollectionView {
            return data.count
        }
            return 0
}
                    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if collectionView == NewAlbumDetailCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewAlbumDetailCollectionViewCell
            cell.newAlbumDetailTitleLabel.text = data[indexPath.row]
            cell.newAlbumDetailImageView.image = UIImage(named: "like_test")
            cell.newAlbumDetailArtistName.text = data[indexPath.row]
            cell.backgroundColor = .white
            return cell
        }
            return cell
        }
}



