//
//  ViewController.swift
//  FinalProject
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    @IBOutlet weak var countryTableView: UITableView!
    
    var teams: [Team] = [] {
        didSet {
            countryTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.register(UINib(nibName: HomeTableViewCell.TAG, bundle: nil), forCellReuseIdentifier: "homeCell")
        countryTableView.delegate = self
        countryTableView.dataSource = self
        
        RestFacade.getTeams { [weak self] (teams, error) in
            self?.teams = teams
            self?.countryTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        let team = teams[indexPath.row]
        
        if let urlString = team.flag?.url, let url = URL(string: urlString) {
            cell.imgTeam.kf.setImage(with: url)
        }
        
        cell.lblNameTeam.text = team.name
        
        return cell
    }
}
