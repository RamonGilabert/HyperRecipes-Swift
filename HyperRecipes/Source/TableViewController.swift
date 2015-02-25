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
    case Favorite = 0
    case Regular = 1

    static var count: Int { return RecipeType.Regular.hashValue + 1 }
}

class TableViewController: UITableViewController {

    let cellIdentifier :String = "MyCell"

    static var allRecipes = Recipe.allObjects().sortedResultsUsingProperty("name", ascending: true)
    var favoriteRecipes = allRecipes.objectsWithPredicate(NSPredicate(format: "favorite = true"))
    var regularRecipes  = allRecipes.objectsWithPredicate(NSPredicate(format: "favorite = false"))

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hyper Recipes"
        tableView.registerClass(RecipeCell.self, forCellReuseIdentifier: RecipeCell.identifier())
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addRecipeAction")
    }

    override func viewDidAppear(animated: Bool) {
        Recipe.fetchRecipes {
            self.tableView.reloadData()
        }
    }

    // MARK: UITableViewDataSource

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :RecipeCell = tableView.dequeueReusableCellWithIdentifier(RecipeCell.identifier(), forIndexPath: indexPath) as! RecipeCell

        let source = indexPath.section == RecipeType.Favorite.hashValue ?
            favoriteRecipes : regularRecipes
        let recipe = source?.objectAtIndex(UInt(indexPath.row)) as! Recipe

        cell.configureCell(recipe, indexPath: indexPath)

        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return RecipeType.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
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
