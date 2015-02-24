//
//  RecipeCell.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 24/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    class func identifier() -> String {
        return "RecipeCell"
    }

    func configureCell(recipe :Recipe, type: RecipeType) {
        self.textLabel?.text = recipe.name

        switch(type) {
        case RecipeType.Favorite:
            self.textLabel?.text = "❤️\(recipe.name)"
        default:
            self.textLabel?.text = recipe.name
        }

        self.detailTextLabel?.text = recipe.instructions
    }

}
