//
//  RLMObjectExtensions.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 23/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import Realm

extension RLMObject {

    class func objectWithQueryString(query: String) -> RLMResults? {
        let predicate = NSPredicate(format: query)
        let recipes = Recipe.objectsWithPredicate(predicate)

        return recipes
    }

}
