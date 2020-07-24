//
//  ChartDetailTableViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/25.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ChartDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var chartDetailImageView: UIImageView!
    @IBOutlet weak var chartDetailRankLabel: UILabel!
    @IBOutlet weak var chartDetailTitleLabel: UILabel!
    @IBOutlet weak var chartDetailArtistName: UILabel!
    @IBOutlet weak var chartDetailOptionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
