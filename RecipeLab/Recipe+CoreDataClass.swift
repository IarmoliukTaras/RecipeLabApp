//
//  Recipe+CoreDataClass.swift
//  RecipeLab
//
//  Created by 123 on 30.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Recipe)
public class Recipe: NSManagedObject {

    func setAttributes(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? " "
        self.ingredients = dictionary["ingredients"] as? String ?? " "
        self.href = dictionary["href"] as? String ?? " "
        self.thumbnail = dictionary["thumbnail"] as? String ?? " "
        PupppyService.sharedInstance.downloadImage(urlStr: self.thumbnail!) { (data) in
            self.image = data as NSData
        }
        self.searchWord = dictionary["searchWord"] as? String ?? " "
    }
}
