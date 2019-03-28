//
//  RestFacade.swift
//  FinalProject
//
//  Created by Felipe Gonçalves da Rocha on 29/03/19.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import Foundation

class RestFacade {
    static func getTeams(callback : @escaping (_ teams : [Team], _ error : Error?)->()) {
        API.getTeams.request { (teamsJSON, error) in
            if let jsonData = teamsJSON {
                var teamVO : TeamVO? = nil
                do {
                    teamVO =  try JSONDecoder().decode(TeamVO.self, from: jsonData)
                } catch {
                    print(error)
                }
                
                guard let results = teamVO?.results else { return }
                
                callback(results, error)
            }
        }
    }
}
