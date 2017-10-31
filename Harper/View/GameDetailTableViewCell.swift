//
//  GameDetailTableViewCell.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/28/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class GameDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var gameDetailCellLabel: UILabel!
    @IBOutlet weak var gameDetailCellValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
