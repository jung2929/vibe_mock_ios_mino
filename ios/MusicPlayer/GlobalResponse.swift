//
//  GlobalResponse.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct globalResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: globalInfo!
}

extension globalResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct globalInfo {
    var music: [globalMusic]!
    var date: globalDateClass!
}

extension globalInfo: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        music <- map["music"]
        date <- map["date"]
    }

}

struct globalDateClass {
    var date: String!
}

extension globalDateClass: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        date <- map["date"]
    }

}

struct globalMusic {
    var musicID: Int!
    var musicName: String!
    var albumImage: String!
    var artistName: String!
    var albumID: Int!
    var artistID: Int!
}

extension globalMusic: Mappable {

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
