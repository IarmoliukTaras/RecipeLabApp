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
        recipeTableView.estimatedRowHeight = 150
        recipeTableView.rowHeight = UITableViewAutomaticDimension
        
        let recipes = PresistenceService.getRecipes()
        self.reloadRecipeTableView(recipes: recipes)
        
        PupppyService.sharedInstance.getRecipes() { (recipes) in
            DataService.sharedInstance.addRecipes(recipes)
        }
        
        DataService.sharedInstance.getRecipes { (recipes) in
            DispatchQueue.main.async {
                self.reloadRecipeTableView(recipes: recipes)
            }
        }
    }
    
    func reloadRecipeTableView(recipes: [Recipe]) {
        if recipes.count > 0 {
            self.recipes = recipes
            self.recipeTableView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

