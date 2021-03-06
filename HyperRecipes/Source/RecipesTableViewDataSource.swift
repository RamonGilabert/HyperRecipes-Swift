//
//  RecipesTableViewDataSource.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 2/25/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit

class RecipesTableViewDataSource: NSObject, UITableViewDataSource {

    static var allRecipes = Recipe.allObjects().sortedResultsUsingProperty("name", ascending: true)
    var favoriteRecipes = allRecipes.objectsWithPredicate(NSPredicate(format: "favorite = %@", true))
    var regularRecipes  = allRecipes.objectsWithPredicate(NSPredicate(format: "favorite = %@", false))

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :AnyObject;
        if indexPath.section == RecipeType.Favorite.hashValue {
            let source = favoriteRecipes
            let recipe = source?.objectAtIndex(UInt(indexPath.row)) as! Recipe
            let favoriteCell = tableView.dequeueReusableCellWithIdentifier("RecipeTableViewFavoriteCell", forIndexPath: indexPath) as! RecipeTableViewCellFavorite
            favoriteCell.nameLabel?.text = recipe.name
            
            cell = favoriteCell
        } else {
            let source = regularRecipes
            let recipe = source?.objectAtIndex(UInt(indexPath.row)) as! Recipe
            let regularCell = tableView.dequeueReusableCellWithIdentifier("RecipeTableViewRegularCell", forIndexPath: indexPath) as! RecipeTableViewCellRegular
            regularCell.nameLabel?.text = recipe.name
            
            cell = regularCell
        }
        
        return cell as! UITableViewCell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return RecipeType.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case RecipeType.Favorite.hashValue:
            return Int(favoriteRecipes!.count)
        case RecipeType.Regular.hashValue:
            return Int(regularRecipes!.count)
        default:
            return 0
        }
    }

}
