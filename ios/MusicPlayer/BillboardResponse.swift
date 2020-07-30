//
//  BillboardResponse.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct billboardResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: billboardInfo!
}

extension billboardResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct billboardInfo {
    var music: [billboardMusic]!
    var date: billboardDateClass!
}

extension billboardInfo: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        music <- map["music"]
        date <- map["date"]
    }

}

struct billboardDateClass {
    var data: String!
}

extension billboardDateClass: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        data <- map["data"]
    }

}

struct billboardMusic {
    var musicID: Int!
    var musicName: String!
    var albumImage: String!
    var artistName: String!
    var albumID: Int!
    var artistID: Int!
}

extension billboardMusic: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        musicID <- map["musicID"]
        musicName <- map["musicName"]
        albumImage <- map["albumImage"]
        artistName <- map["artistName"]
        albumID <- map["albumID"]
        artistID <- map["artistID"]
    }

}
