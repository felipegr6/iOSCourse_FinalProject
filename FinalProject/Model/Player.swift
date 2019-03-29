//
//  Player.swift
//  FinalProject
//
//  Created by Felipe Gonçalves da Rocha on 29/03/19.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import Foundation

struct PlayerRequest : Codable {
    let team : TeamData
}

struct TeamData : Codable {
    let className : String = "Team"
    let type : String = "Pointer"
    let teamId : String
    
    enum CodingKeys : String, CodingKey {
        case className
        case type = "__type"
        case teamId = "objectId"
    }
}

struct PlayersVO : Codable {
    let results : [Player]
}

struct Player : Codable {
    let id : String
    let age : Int
    let birthday : String
    let club : String
    let name : String
    let order : Int
    let position : String
    let images : [String]?
    
    enum CodingKeys : String, CodingKey {
        case id = "objectId"
        case age
        case birthday
        case club
        case name
        case order
        case position
        case images
    }
}
