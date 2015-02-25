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

    var dataSource: TableViewDataSource!

    override init(style: UITableViewStyle) {
        super.init(style: style)

        self.dataSource = TableViewDataSource.new()
        self.tableView.dataSource = self.dataSource
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

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

    // MARK: Actions

    func addRecipeAction() {
        var detailViewController = DetailViewController.new()
        presentViewController(detailViewController, animated: true) {}
    }

}
