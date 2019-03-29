//
//  PlayerTableViewCell.swift
//  FinalProject
//
//  Created by Virtual Machine on 29/03/2019.
//  Copyright © 2019 iOSCourse. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var ivItem: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
