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
        guard let searchWord = searchBar.text?.replacingOccurrences(of: " ", with: "%20").lowercased() else { return }
        
        let recipes = PresistenceService.getRecipeBy(searchWord: searchWord)
        self.reloadRecipeTableView(recipes: recipes)
        
        PupppyService.sharedInstance.getRecipes(searchWord: searchWord, completed: { (recipes) in
            DispatchQueue.main.async {
                self.reloadRecipeTableView(recipes: recipes)
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            let recipes = PresistenceService.getRecipes()
            self.reloadRecipeTableView(recipes: recipes)
        }
    }
}
