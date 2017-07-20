//
//  RecipeImageView.swift
//  RecipeLab
//
//  Created by 123 on 20.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class RecipeImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
        self.contentMode = .scaleToFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
    }

}
