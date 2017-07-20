//
//  PupppyService.swift
//  RecipeLab
//
//  Created by 123 on 20.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation

class PupppyService {
    
    static let sharedInstance = PupppyService()
    
    let defaultUrl = "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3"
    
    func getRecipes(url: String, completed: @escaping ([[String: Any]]) -> ()) {
        guard let recipesUrl = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: recipesUrl) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }

            guard let jsonData = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                
                guard let dictionary = json as? [String: Any] else { return }
                guard let results = dictionary["results"] as? [[String: Any]] else { return }
                completed(results)
            } catch let jsonError {
                print(jsonError)
                
            }
        }.resume()
    }
    
    
}
