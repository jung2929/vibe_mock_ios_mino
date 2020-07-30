//
//  TutorialResponse.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct musicResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: musicInfo!
}

extension musicResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct musicInfo {
    var albumImage: String!
    var albumId: Int!
    var musicId: Int!
    var musicName: String!
    var artistName: String!
    var musicFile: String!
    var artistId: Int!
}

extension musicInfo: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        albumImage <- map["albumImage"]
        albumId <- map["albumId"]
        musicId <- map["musicId"]
        musicName <- map["musicName"]
        artistName <- map["artistName"]
        musicFile <- map["musicFile"]
        artistId <- map["artistId"]
    }

}
