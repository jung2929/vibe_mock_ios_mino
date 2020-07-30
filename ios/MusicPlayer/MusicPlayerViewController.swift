//
//  MusicPlayerViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import Kingfisher

@available(iOS 13.0, *)
class MusicPlayerViewController: BaseViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var playControlButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    @IBAction func heartButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    @IBAction func shuffleButton(_ sender: UIButton) {
        musicId = Int.random(in: 1...16)
        MusicDataManager().getMusic(self, musicId: self.musicId!)
    }
    
    let simplePlayer = SimplePlayer.shared
    var timeObserver: Any?
    var isSeeking: Bool = false
    var musicId: Int? = 1
    var urlString: String?
    var player: AVPlayer?
    
        
        override func viewDidLoad() { // 플레이어 뷰컨트롤러가 메모리에 로드될때 호출
            super.viewDidLoad()

            updatePlayButton()
            updateTime(time: CMTime.zero)
            //CMTime(seconds: 1, preferredTimescale: 10) // avfoundation coremedia / coremeia 에서 0.1초씩 관찰하려고 함. 1초를 10분의 1로 분할시킬꺼다.
            timeObserver = simplePlayer.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main/* 메인스레드한테 0.1초마다 알려주겠다. */, using: { time in
                self.updateTime(time: time)
            }) // 재생되는 아이템의 시간을 관찰하겠다.
        }
        
        override func viewWillAppear(_ animated: Bool) { // 보이기전에 호출
            super.viewWillAppear(animated)
            updateTrackInfo()
            MusicDataManager().getMusic(self, musicId: self.musicId!)
        }
        
        @IBAction func beginDrag(_ sender: UISlider) {
            isSeeking = true
        }
        
        @IBAction func endDrag(_ sender: UISlider) {
            isSeeking = false
        }
        
        @IBAction func seek(_ sender: UISlider) {
            guard let currentItem = simplePlayer.currentItem else { return }
            let position = Double(sender.value) // 0... 1 > 0.5
            let seconds = position * currentItem.duration.seconds
            let time = CMTime(seconds: seconds, preferredTimescale: 100)
            simplePlayer.seek(to: time)
        }
        
        @IBAction func togglePlayButton(_ sender: UIButton) {
            if simplePlayer.isPlaying {
                simplePlayer.pause()
            } else {
                simplePlayer.play()
            }
            updatePlayButton()
        }
    }

@available(iOS 13.0, *)
extension MusicPlayerViewController {
        func updateTrackInfo() { // 받은 곡정보를 가지고 뷰를 업데이트
            guard let track = simplePlayer.currentItem?.convertToTrack() else { return }
            thumbnailImageView.image = track.artwork
            titleLabel.text = track.title
            artistLabel.text = track.artist
        }
        
        func updateTime(time: CMTime) {
            // print(time.seconds)
            // currentTime label, totalduration label, slider
            
            currentTimeLabel.text = secondsToString(sec: simplePlayer.currentTime)   // 3.1234 >> 00:03
            totalDurationLabel.text = secondsToString(sec: simplePlayer.totalDurationTime)  // 39.2045  >> 00:39
            
            if isSeeking == false {
                // 노래 들으면서 시킹하면, 자꾸 슬라이더가 업데이트 됨, 따라서 시킹아닐때마 슬라이더 업데이트하자
                timeSlider.value = Float(simplePlayer.currentTime/simplePlayer.totalDurationTime)
                
            }
        }
        
        func secondsToString(sec: Double) -> String {
            guard sec.isNaN == false else { return "00:00" }
            let totalSeconds = Int(sec)
            let min = totalSeconds / 60
            let seconds = totalSeconds % 60
            return String(format: "%02d:%02d", min, seconds)
        }
        
        func updatePlayButton() {
            if simplePlayer.isPlaying {
                let configuration = UIImage.SymbolConfiguration(pointSize: 40)
                let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
                playControlButton.setImage(image, for: .normal)
            } else {
                let configuration = UIImage.SymbolConfiguration(pointSize: 40)
                let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
                playControlButton.setImage(image, for: .normal)
            }
        }
    }
