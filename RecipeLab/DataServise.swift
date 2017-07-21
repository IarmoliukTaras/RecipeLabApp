//
//  DataServise.swift
//  RecipeLab
//
//  Created by 123 on 22.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import FirebaseDatabase

class DataService {
    
    static let sharedInstance = DataService()
    
    private var _RECIPE_REF = FIRDatabase.database().reference().child("recipe")
    
    var RECIPE_REF: FIRDatabaseReference {
        return _RECIPE_REF
    }
    
    func addRecipe(_ recipe: Recipe) {
        let values = ["ingredients": recipe.ingredients,
                      "imageUrl": recipe.imageUrl,
                      "pageUrl": recipe.pageUrl]
        
        RECIPE_REF.child(recipe.title).setValue(values)
        
    }
    
//    
//    var CURRENT_USER_REF: FIRDatabaseReference {
//        let uid = KeychainWrapper.standard.string(forKey: "uid")
//        let user = USER_REF.child(uid!)
//        return user
//    }
//    
//    var CURRENT_USER_CITIES_REF: FIRDatabaseReference {
//        return CURRENT_USER_REF.child("cities")
//    }
//    
//    func addCity(cityName: String) {
//        CURRENT_USER_REF.child("cities").updateChildValues([cityName: cityName])
//    }
//    
//    func observeCities(completed: @escaping ([String]) -> ()) {
//        DataService.dataService.CURRENT_USER_CITIES_REF.observe(.value, with: {(snapshot) in
//            guard let dataSnapshot = snapshot.children.allObjects as? [FIRDataSnapshot] else { return }
//            completed(dataSnapshot.map{$0.key})
//        })
//    }
//    
//    func removeCity(name: String) {
//        DataService.dataService.CURRENT_USER_CITIES_REF.child(name).removeValue()
//    }
//    
}
