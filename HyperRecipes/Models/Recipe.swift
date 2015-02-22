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
    dynamic var remoteID = 0
    dynamic var instructions = ""
    dynamic var name = ""
    dynamic var photoURL = ""
    dynamic var updatedAt = NSDate(timeIntervalSince1970: 1)

}
