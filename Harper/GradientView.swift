//
//  GradientView.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/20/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class GradientView: UIView {

    override public class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
        gradientLayer.colors = [
            UIColor.black.withAlphaComponent(0).cgColor,
            UIColor.black.withAlphaComponent(0.15).cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
        ]
        gradientLayer.locations = [0,0.5,1]
    }

}
