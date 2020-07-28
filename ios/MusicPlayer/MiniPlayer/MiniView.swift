//
//  MiniView.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/26.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MiniView: UIView {
    private let xibName = "MiniView"
    
    @IBOutlet weak var miniImageView: UIImageView!
    @IBOutlet weak var miniTitleLabel: UILabel!
    @IBOutlet weak var miniArtistName: UILabel!
    @IBOutlet weak var miniPlayButton: UIButton!
    @IBOutlet weak var miniForwardButton: UIButton!
    @IBOutlet weak var miniMusicListButton: UIButton!
    @IBAction func miniPresentModalButton(_ sender: Any) {

        
    }

//    let musicPlayerViewController = MusicPlayerViewController(nibName: "MusicPlayerViewController", bundle: nil)
//    MiniView.present(musicPlayerViewController, animated: true, completion: nil)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}

