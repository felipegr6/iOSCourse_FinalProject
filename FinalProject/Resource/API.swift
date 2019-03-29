//
//  API.swift
//  FinalProject
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    case getTeams
    case getPlayersBy(teamId : String)
    case openPackage
}

extension API {
    struct Constants {
        static let baseURL : String = "<url>"
        static let headers : HTTPHeaders = [
            "X-Parse-Application-Id": "<app_id>",
            "Content-Type": "application/json"
        ]
    }
    
    var path : String {
        switch self {
        case .getTeams:
            return "classes/Team?order=name"
        case .getPlayersBy(let teamId):
            var json = ""
            do {
                let data: PlayerRequest = PlayerRequest(team: TeamData(teamId: teamId))
                json = try String(data: JSONEncoder().encode(data), encoding: .utf8) ?? ""
            } catch {
                print(error)
            }
            return "classes/Player?include=team&where=\(json)"
        case .openPackage:
            return "functions/openPackage"
        }
    }
    
    var url : String { return (API.Constants.baseURL + path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" }
    
    var httpMethod : HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    func request(
        params : [String : Any] = [ : ],
        callback:@escaping (_ data : Data?,
        _ error : Error?)->()) {
        
        let request = Alamofire.request(
            url,
            method: httpMethod,
            parameters: nil,
            encoding: JSONEncoding.prettyPrinted,
            headers: API.Constants.headers
        )
        
        request.validate().responseData { response in
            debugPrint(response.request?.url?.absoluteString)
            debugPrint("Status code: \(response.response?.statusCode ?? 0)")
            DispatchQueue.main.async {
                switch response.result {
                case .success:
                    callback(response.result.value, response.error)
                case .failure(let error):
                    callback(nil, error)
                }
            }
        }
    }
}
