//
//  ChartResponse.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct chartResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: Results!
}

extension chartResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct Results {
    var music: [Music]!
    var date: DateClass!
}

extension Results: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        music <- map["music"]
        date <- map["date"]
    }

}

struct DateClass {
    var date: String!
}

extension DateClass: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        date <- map["date"]
    }

}

struct Music: Codable {
    var musicID: Int!
    var musicName: String!
    var albumImage: String!
    var artistName: String!
    var albumID, artistID: Int!
}

extension Music: Mappable {

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
