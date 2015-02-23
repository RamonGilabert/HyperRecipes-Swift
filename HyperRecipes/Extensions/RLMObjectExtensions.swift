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
        let objects = Recipe.objectsWithPredicate(predicate)

        return objects
    }

    class func defaultRealmTransaction( transaction: () -> (), completion: () -> () ) {
        RLMRealm.defaultRealm().beginWriteTransaction()
        transaction()
        RLMRealm.defaultRealm().commitWriteTransaction()
        completion()
    }

}
