//
//  Recipe.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 22/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit
import Realm

class Recipe: RLMObject {

    dynamic var createdAt = NSDate(timeIntervalSince1970: 1)
    dynamic var descriptionString = ""
    dynamic var difficulty = ""
    dynamic var favorite = false
    dynamic var id = 0
    dynamic var instructions = ""
    dynamic var name = ""
    dynamic var photoURL = ""
    dynamic var updatedAt = NSDate(timeIntervalSince1970: 1)

    override class func primaryKey() -> String {
        return "id"
    }

    class func processRecipes(recipes :Array<NSDictionary>) {
        RLMRealm.defaultRealm().beginWriteTransaction()
        for recipe in recipes {
            Recipe.pricessRecipe(recipe)
        }
        RLMRealm.defaultRealm().commitWriteTransaction()
    }

    class func pricessRecipe(recipe :NSDictionary) {
        var recipeDictionary: NSMutableDictionary = recipe.mutableCopy() as! NSMutableDictionary

        for (key, value) in recipe {
            if (value.isKindOfClass(NSNull.classForCoder())) {
                recipeDictionary.removeObjectForKey(key);
            }
        }

        Recipe.createOrUpdateInDefaultRealmWithObject(recipeDictionary)
    }

}
