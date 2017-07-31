//
//  Recipe+CoreDataProperties.swift
//  RecipeLab
//
//  Created by 123 on 31.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var href: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var searchWord: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?
    @NSManaged public var image: NSData?

}
