//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.


import Alamofire
import AlamofireObjectMapper
import AlamofireImage
import Kingfisher
import AVFoundation

@available(iOS 13.0, *)
class MusicDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func getMusic(_ musicPlayerVC: MusicPlayerViewController, musicId: Int) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/musics/\(musicId)", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<musicResponse>) in
                switch response.result {
                case .success(let musicResponse):
                    if musicResponse.code == 100 {
                        let imageUrlFromData = musicResponse.result?.albumImage
                        let url = URL(string: imageUrlFromData!)
                        
                        musicPlayerVC.thumbnailImageView.kf.setImage(with: url)
                        musicPlayerVC.musicId = musicResponse.result?.musicId
                        musicPlayerVC.titleLabel.text = musicResponse.result?.musicName
                        musicPlayerVC.artistLabel.text = musicResponse.result?.artistName
                        musicPlayerVC.urlString = musicResponse.result?.musicFile
                        
                        let musicUrl = URL(string: musicPlayerVC.urlString!)
                        let playerItem: AVPlayerItem = AVPlayerItem(url: musicUrl!)
//                        musicPlayerVC.player = AVPlayer(playerItem: playerItem)
                        musicPlayerVC.simplePlayer.replaceCurrentItem(with: playerItem)
                        print("success")
                        
                    } else {
                        musicPlayerVC.titleLabel.text = "음악 정보를 불러오는데 실패하였습니다."
                        print("왜안돼")
                    }
                case .failure:
                    musicPlayerVC.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                    print("networking fail")
                }
            })
    }
}
