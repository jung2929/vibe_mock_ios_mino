//
//  TrackManager.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/01/12.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    var tracks: [AVPlayerItem] = []
    
    init() {
        let tracks = loadTracks() // 트랙매니저가 이니셜라이즈 할때 트랙을 로드.
        self.tracks = tracks // update
        
    }

    func loadTracks() -> [AVPlayerItem] {
        //파일들 읽어서 AVPlayerItem 만들기
        // 파일 urls 가져오기
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? [] // bundle = 앱안에 있는것들
        // url 이 여러개일 때 맵을 사용하는 것이 더 좋음
//        var items: [AVPlayerItem] = []
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            items.append(item)
//        }
        
        let items = urls.map { url in
            return AVPlayerItem(url: url)
        }
        
        return items
    }
    
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        let track = playerItem.convertToTrack()
        return track
    }

}
