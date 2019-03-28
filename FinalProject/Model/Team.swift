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
    let code : String?
    let color : String?
    let name : String?
    let flag : Flag?
}

struct Flag : Codable {
    var url : String
}
