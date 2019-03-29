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
    
    static func getPlayers(teamId : String, callback : @escaping (_ players : [Player], _ error : Error?)->()) {
        API.getPlayersBy(teamId: teamId).request { (playersJson, error) in
            if let jsonData = playersJson {
                var playersVO : PlayersVO? = nil
                do {
                    playersVO = try JSONDecoder().decode(PlayersVO.self, from: jsonData)
                } catch {
                    print(error)
                }
                
                guard let results = playersVO?.results else { return }
                
                callback(results, error)
            }
        }
    }
}
