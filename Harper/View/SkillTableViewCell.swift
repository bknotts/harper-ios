//
//  SkillTableViewCell.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/25/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellContainerView: UIView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellContainerView.layer.cornerRadius = 12
        cellContainerView.layer.shadowColor = UIColor.black.cgColor
        cellContainerView.layer.shadowOpacity = 0.1
        cellContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cellContainerView.layer.shadowRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
