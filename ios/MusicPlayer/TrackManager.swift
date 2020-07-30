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
    // TODO: 프로퍼티 정의하기 - 트랙들, 앨범들, 오늘의 곡
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    // TODO: 생성자 정의하기
    init() {
        let tracks = loadTracks() // 트랙매니저가 이니셜라이즈 할때 트랙을 로드.
        self.tracks = tracks // update
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement() // 아이템 어레이안에 있는 요소를 랜덤으로 들고오는것.
        
    }

    // TODO: 트랙 로드하기
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
    
    // TODO: 인덱스에 맞는 트랙 로드하기
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        let track = playerItem.convertToTrack()
        return track
    }

    // TODO: 앨범 로딩메소드 구현
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        //tracks 는 avplayeritem 의 배열
        // 각각의 아이템을 컴팩트맵을 이용해서 [Track] 으로 변경시키는 것.
        let trackList: [Track] = tracks.compactMap { $0.convertToTrack() }
        // album 에 대한 정보를 딕셔너리로 만듦.
        // track 들을 이용해서 앨범이 같은 애들을 그룹핑. 딕셔너리는 각각의 앨범의 이름들로 트랙을 나눌 것.
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        // album 어레이를 만드는 과정
        // 책을 관리할 때, 책을 작가별로 분류하고싶다 이럴 때 쓰는 기법
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }

    // TODO: 오늘의 트랙 랜덤으로 선택
    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement() // 아이템 어레이안에 있는 요소를 랜덤으로 들고오는것.
    }
}
