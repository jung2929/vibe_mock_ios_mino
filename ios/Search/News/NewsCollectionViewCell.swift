//
//  NewsCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/21.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var NewsImageView: UIImageView!
    @IBOutlet weak var NewsTitleLabel: UILabel!
    @IBOutlet weak var NewsPlayButton: UIButton!
    @IBOutlet weak var NewsPlayLabel: UILabel!
    @IBAction func NewsLookButton(_ sender: Any) {
//        let musicPlayerViewController = MusicPlayerViewController(nibName: "MusicPlayerViewController", bundle: nil)
//        self.present(musicPlayerViewController, animated: true, completion: nil)
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
