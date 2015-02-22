//
//  RecipesTableViewController.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 18/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit
import Realm

class TableViewController: UITableViewController {

    let cellIdentifier :String = "MyCell"

    var recipesArray = {
        return Recipe.allObjects()
    }

    var networking :Networking {
        return Networking.new()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hyper Recipes"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addRecipeAction")
    }

    override func viewDidAppear(animated: Bool) {
        networking.getRecipes {
            response in
            Recipe.processRecipes(response as! Array<NSDictionary>) {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell

        let currentRecipe = recipesArray().objectAtIndex(UInt(indexPath.row)) as! Recipe
        cell.textLabel?.text = currentRecipe.name
        cell.detailTextLabel?.text = currentRecipe.instructions

        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(recipesArray().count)
    }

    // MARK: Actions

    func addRecipeAction() {

    }

}
