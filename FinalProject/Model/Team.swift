//
//  Country.swift
//  FinalProject
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import UIKit

struct TeamVO : Codable {
    let results : [Team]
}

struct Team : Codable {
    let id : String?
    let code : String?
    let color : String?
    let name : String?
    let flag : Flag?
    
    enum CodingKeys : String, CodingKey {
        case id = "objectId"
        case code
        case color
        case name
        case flag
    }
}

struct Flag : Codable {
    var url : String
}
