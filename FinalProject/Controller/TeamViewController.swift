//
//  TeamViewController.swift
//  FinalProject
//
//  Created by Virtual Machine on 29/03/2019.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import UIKit
import Kingfisher

class TeamViewController: UIViewController {
    
    @IBOutlet weak var ivTeam: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var cvPlayers: UICollectionView!
    
    var team : Team? = nil
    var players : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TEAM"
        
        cvPlayers.delegate = self
        cvPlayers.dataSource = self
        
        setupViews()
        requestData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "playerDetailSegue" {
            let playerDetailVC = segue.destination as? PlayerDetailViewController
            playerDetailVC?.player = sender as? Player
        }
    }
    
    func setupViews() {
        guard let t = team else { return }
        
        if let urlString = t.flag?.url, let url = URL(string: urlString) {
            ivTeam.kf.setImage(with: url)
        }
        lblName.text = t.name
        lblCount.text = "0/0"
        
        cvPlayers.register(UINib(nibName: "PlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "playerCell")
        cvPlayers.register(UINib(nibName: "HeaderTeamCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerTeamCell")
    }
    
    func requestData() {
        guard let id = team?.id else { return }
        RestFacade.getPlayers(teamId: id) { [weak self] (players, error) in
            self?.players = players
            self?.cvPlayers.reloadData()
        }
    }
}

extension TeamViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "playerDetailSegue", sender: players[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as! PlayerCollectionViewCell
        
        let player = players[indexPath.row]
        
        cell.lblNamePlayer.text = player.name
        cell.lblPosition.text = player.position
        
        if let img = player.images?[0], let url = URL(string: img) {
            cell.ivPlayer.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerTeamCell", for: indexPath)
    }
}

extension TeamViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = view.frame.width / 3 - 1
        let h = view.frame.width / 3
        
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let w = view.frame.width
        
        return CGSize(width: w, height: 56)
    }
}
