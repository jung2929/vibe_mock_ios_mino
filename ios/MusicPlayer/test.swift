////
////  test.swift
////  VIBE
////
////  Created by 조민호 on 2020/07/30.
////  Copyright © 2020 Jerry Jung. All rights reserved.
////
//
//import Foundation
// //TODO: SimplePlayer 만들고 프로퍼티 추가
//    var musicId: Int? = 1
//    var timeObserver: Any?
//    var isSeeking: Bool = false
//    var urlString: String?
//    var player: AVPlayer?
//    
//    var currentTime: Double {
//        return player?.currentItem?.currentTime().seconds ?? 0 // currentItem을 가져오고, 없을 수도 있으니 옵셔널, 아이템에서 현재 시간을 가져오고, cmtime인 타입을 seconds 로 더블타입으로 변경해준다.
//    }
//        
//    var totalDurationTime: Double {
//        return player?.currentItem?.duration.seconds ?? 0 // duration - 총 길이.
//    }
//        
//    var isPlaying: Bool {
//        player!.isPlaying
//    }
//        
//    func pause() {
//        player!.pause()
//    }
//        
//    func play() {
//        player!.play()
//    }
//        
//    func seek(to time:CMTime) {
//        player?.seek(to: time)
//    }
//        
//    func replaceCurrentItem(with item: AVPlayerItem?) {
//        player!.replaceCurrentItem(with: item)
//    }
//    
//    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
//        player!.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
//    }
//    
//    override func viewDidLoad() { // 플레이어 뷰컨트롤러가 메모리에 로드될때 호출
//        super.viewDidLoad()
////        audioPlayerInit()
//        
//        
//        updateTime(time: CMTime.zero)
//        // TODO: TimeObserver 구현
//        //CMTime(seconds: 1, preferredTimescale: 10) // avfoundation coremedia / coremeia 에서 0.1초씩 관찰하려고 함. 1초를 10분의 1로 분할시킬꺼다.
//        timeObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main/* 메인스레드한테 0.1초마다 알려주겠다. */, using: { time in
//            self.updateTime(time: time)
//        }) // 재생되는 아이템의 시간을 관찰하겠다.
//    }
//    
//    
//    
//    override func viewWillAppear(_ animated: Bool) { // 보이기전에 호출
//        super.viewWillAppear(animated)
//        MusicDataManager().getMusic(self, musicId: self.musicId!)
//        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
//        let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
//        playControlButton.setImage(image, for: .normal)
//    }
//    
//    @IBAction func beginDrag(_ sender: UISlider) {
//        isSeeking = true
//    }
//    
//    @IBAction func endDrag(_ sender: UISlider) {
//        isSeeking = false
//    }
//    
//    @IBAction func seek(_ sender: UISlider) {
//        // TODO: 시킹 구현
//        guard let currentItem = player?.currentItem else { return }
//        let position = Double(sender.value) // 0... 1 > 0.5
//        let seconds = position * currentItem.duration.seconds
//        let time = CMTime(seconds: seconds, preferredTimescale: 100)
//        player?.seek(to: time)
//    }
//    
//    @available(iOS 13.0, *)
//    @IBAction func togglePlayButton(_ sender: UIButton) {
//        // TODO: 플레이버튼 토글 구현
//        if player!.isPlaying {
//            player!.pause()
//        } else {
//            player!.play()
//        }
//        updatePlayButton()
//    }
//    
//    func updateTime(time: CMTime) {
//        // print(time.seconds)
//        // currentTime label, totalduration label, slider
//        
//        // TODO: 시간정보 업데이트, 심플플레이어 이용해서 수정
//        currentTimeLabel.text = secondsToString(sec: currentTime)   // 3.1234 >> 00:03
//        totalDurationLabel.text = secondsToString(sec: totalDurationTime)  // 39.2045  >> 00:39
//        
//        if isSeeking == false {
//            // 노래 들으면서 시킹하면, 자꾸 슬라이더가 업데이트 됨, 따라서 시킹아닐때마 슬라이더 업데이트하자
//            // TODO: 슬라이더 정보 업데이트
//            timeSlider.value = Float(currentTime/totalDurationTime)
//            
//        }
//    }
//    
//    func secondsToString(sec: Double) -> String {
//        guard sec.isNaN == false else { return "00:00" }
//        let totalSeconds = Int(sec)
//        let min = totalSeconds / 60
//        let seconds = totalSeconds % 60
//        return String(format: "%02d:%02d", min, seconds)
//    }
//    
//    @available(iOS 13.0, *)
//    func updatePlayButton() {
//        // TODO: 플레이버튼 업데이트 UI작업 > 재생/멈춤
//        if player!.isPlaying {
//            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
//            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
//            playControlButton.setImage(image, for: .normal)
//        } else {
//            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
//            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
//            playControlButton.setImage(image, for: .normal)
//        }
//    }
//    
//}
//
//extension AVPlayer {
//    var isPlaying: Bool {
//        guard self.currentItem != nil else { return false }
//        return self.rate != 0
//    }
//}
