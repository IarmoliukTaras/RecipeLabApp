//
//  RecipeVC.swift
//  RecipeLab
//
//  Created by 123 on 20.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
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
                DispatchQueue.main.async {
                    self.recipeTableView.reloadData()
                }
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        
        return cell
    }

}

