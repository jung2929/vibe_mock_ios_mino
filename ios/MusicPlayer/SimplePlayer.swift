//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/03/15.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import AVFoundation

class SimplePlayer {
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()

    var currentTime: Double {
        return player.currentItem?.currentTime().seconds ?? 0 // currentItem을 가져오고, 없을 수도 있으니 옵셔널, 아이템에서 현재 시간을 가져오고, cmtime인 타입을 seconds 로 더블타입으로 변경해준다.
    }
    
    var totalDurationTime: Double {
        return player.currentItem?.duration.seconds ?? 0 // duration - 총 길이.
    }
    
    var isPlaying: Bool {
        player.isPlaying
    }
    
    var currentItem: AVPlayerItem? {
        return player.currentItem
    }
    
    init() { }
    
    func pause() {
        player.pause()
    }
    
    func play() {
        player.play()
    }
    
    func seek(to time:CMTime) {
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with item: AVPlayerItem?) {
        player.replaceCurrentItem(with: item)
    }
    
    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
