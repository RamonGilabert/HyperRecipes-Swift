//
//  RecipesTableViewController.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 18/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit
import Realm

enum RecipeType: Int {
    case Favorite = 1
    case Regular = 2

    static var count: Int { return RecipeType.Regular.hashValue + 1 }
}

class TableViewController: UITableViewController {

    let cellIdentifier :String = "MyCell"

    var favoriteRecipes = Recipe.objectWithQueryString("favorite = true")
    var regularRecipes = Recipe.objectWithQueryString("favorite = false")

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hyper Recipes"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addRecipeAction")
    }

    override func viewDidAppear(animated: Bool) {
        Recipe.processRecipes {
            self.tableView.reloadData()
        }
    }

    // MARK: UITableViewDataSource

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell

        let source: RLMResults?
        if (indexPath.section == RecipeType.Favorite.hashValue) {
            source = favoriteRecipes!
        } else {
            source = regularRecipes!
        }

        let currentRecipe = source?.objectAtIndex(UInt(indexPath.row)) as! Recipe

        if (indexPath.section == RecipeType.Favorite.hashValue) {
            cell.textLabel?.text = "❤️\(currentRecipe.name)"
        } else {
            cell.textLabel?.text = currentRecipe.name
        }

        cell.detailTextLabel?.text = currentRecipe.instructions

        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return RecipeType.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case RecipeType.Favorite.hashValue:
            return Int(favoriteRecipes!.count)
        case RecipeType.Regular.hashValue:
            return Int(regularRecipes!.count)
        default:
            return 0
        }
    }

    // MARK: Actions

    func addRecipeAction() {
        var detailViewController = DetailViewController.new()
        presentViewController(detailViewController, animated: true) {}
    }

}
