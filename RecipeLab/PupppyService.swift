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
    
    func getRecipes(url: String, completed: @escaping ([Recipe]) -> ()) {
        guard let recipesUrl = URL(string: url) else { return }
        var recipes = [Recipe]()
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
                for result in results {
                    let recipe = Recipe(dictionary: result)
                    recipes.append(recipe)
                }
                completed(recipes)
            } catch let jsonError {
                print(jsonError)
                
            }
        }.resume()
    }
    
    func downloadImage(urlStr: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error {
                print("ERROR:", err)
                return
            }
            guard let data = data else { return }
            completion(data)
        }).resume()
    }
}
