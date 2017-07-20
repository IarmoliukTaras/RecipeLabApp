//
//  RecipeVC.swift
//  RecipeLab
//
//  Created by 123 on 20.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController {
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.estimatedRowHeight = 120
        recipeTableView.rowHeight = UITableViewAutomaticDimension
        
        PupppyService.sharedInstance.getRecipes(url: "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3") { (recipes) in
            self.recipes.removeAll()
            
            for recipe in recipes {
                let aRecipe = Recipe(dictionary: recipe)
                self.recipes.append(aRecipe)
            }
            
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        }
        
    }
}

