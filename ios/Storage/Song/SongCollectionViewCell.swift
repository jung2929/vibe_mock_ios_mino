//
//  SongCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SongCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var SongImageView: UIImageView!
    @IBOutlet weak var SongTitleLabel: UILabel!
    @IBOutlet weak var SongSubTitleLabel: UILabel!
    @IBOutlet weak var SongHeartButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

}
