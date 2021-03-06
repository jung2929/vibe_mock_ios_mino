//
//  ChartResponse.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct localResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: localInfo!
}

extension localResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct localInfo {
    var music: [localMusic]!
    var date: localDateClass!
}

extension localInfo: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        music <- map["music"]
        date <- map["date"]
    }

}

struct localDateClass {
    var date: String!
}

extension localDateClass: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        date <- map["date"]
    }

}

struct localMusic {
    var musicID: Int!
    var musicName: String!
    var albumImage: String!
    var artistName: String!
    var albumID: Int!
}

extension localMusic: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        musicID <- map["musicID"]
        musicName <- map["musicName"]
        albumImage <- map["albumImage"]
        artistName <- map["artistName"]
        albumID <- map["albumID"]
    }

}


