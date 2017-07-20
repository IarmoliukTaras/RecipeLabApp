//
//  RecipeTableViewCell.swift
//  RecipeLab
//
//  Created by 123 on 20.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: RecipeImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(recipe: Recipe) {
        titleLabel.text = recipe.title
        ingredientsTextView.text = recipe.ingredients
    }

}
