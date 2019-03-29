//
//  HomeTableViewCell.swift
//  FinalProject
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let TAG : String = "HomeTableViewCell"

    @IBOutlet weak var imgTeam: UIImageView!
    @IBOutlet weak var lblNameTeam: UILabel!
    @IBOutlet weak var lblAlbumQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
