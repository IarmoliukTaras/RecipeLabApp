//
//  DataServise.swift
//  RecipeLab
//
//  Created by 123 on 22.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Firebase
import FirebaseDatabase

class DataService {
    
    static let sharedInstance = DataService()
    private var _RECIPE_REF = FIRDatabase.database().reference().child("recipe")
    
    var RECIPE_REF: FIRDatabaseReference {
        return _RECIPE_REF
    }
    
    func addRecipes(_ recipes: [Recipe]) {
        var values = [String: String]()
        for recipe in recipes {
            values = ["ingredients": recipe.ingredients,
                          "thumbnail": recipe.imageUrl,
                          "href": recipe.pageUrl]
            RECIPE_REF.child(recipe.title.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)).setValue(values)
        }
    }
    
    func getRecipes(completed: @escaping ([Recipe]) -> ()) {
        RECIPE_REF.queryOrderedByValue().observe(FIRDataEventType.value, with: {(snapshot) in
            var recipes = [Recipe]()
            if snapshot.childrenCount > 0 {
                for recipe in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    if var recipeObject = recipe.value as? [String : String] {
                        recipeObject.updateValue(recipe.key.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines), forKey: "title")
                        let recipe = Recipe(dictionary: recipeObject)
                        recipes.append(recipe)
                    }
                }
            }
            completed(recipes)
        })
    }
}
