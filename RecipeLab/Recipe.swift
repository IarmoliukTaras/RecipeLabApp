//
//  Recipe.swift
//  RecipeLab
//
//  Created by 123 on 20.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation

struct Recipe {
    let title: String
    let ingredients: String
    let imageUrl: String
    let pageUrl: String
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.ingredients = dictionary["ingredients"] as? String ?? ""
        self.pageUrl = dictionary["href"] as? String ?? ""
        self.imageUrl = dictionary["thumbnail"] as? String ?? ""
    }
}
