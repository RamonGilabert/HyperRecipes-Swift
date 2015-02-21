//
//  RecipesDataSource.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 21/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit

class RecipesDataSource: NSObject, UITableViewDataSource {

    let cellIdentifier :String
    var tableView :UITableView?

    init(aTableView: UITableView, aCellIdentifier: String) {
        cellIdentifier = aCellIdentifier
        tableView = aTableView

        super.init()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell

        return cell
    }

}
