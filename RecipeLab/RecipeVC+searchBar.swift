//
//  RecipeVC+searchBar.swift
//  RecipeLab
//
//  Created by 123 on 22.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

extension RecipeVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text!.replacingOccurrences(of: " ", with: "%20")
        PupppyService.sharedInstance.getRecipes(url: searchUrl + text, completed: { (recipes) in
            DispatchQueue.main.async {
                self.recipes = recipes
                self.recipeTableView.reloadData()
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DataService.sharedInstance.getRecipes(completed: { (recipes) in
                self.recipes = recipes
                DispatchQueue.main.async {
                    self.recipes = recipes
                    self.recipeTableView.reloadData()
                }
            })
        }
    }
}
