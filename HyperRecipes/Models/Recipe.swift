//
//  Recipe.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 22/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit
import Realm
import Alamofire

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

    enum EndPoints: String {
        case Fetch = "http://hyper-recipes.herokuapp.com/recipes"
    }

    override class func primaryKey() -> String {
        return "id"
    }

    class func fetchRecipes(completion: () -> ()) {
        Alamofire.request(.GET, EndPoints.Fetch.rawValue, parameters: nil)
            .responseJSON { (_, _, JSON, _) in
                Recipe.defaultRealmTransaction({
                    for recipe in JSON as! Array<NSDictionary> {
                        Recipe.processRecipe(recipe)
                    }
                }, completion: { completion() })
        }
    }

    class func processRecipe(recipe :NSDictionary) {
        Recipe.createOrUpdateInDefaultRealmWithObject(recipe.removeNullValues())
    }

}
