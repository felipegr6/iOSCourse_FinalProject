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
