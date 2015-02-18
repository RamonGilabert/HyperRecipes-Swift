//
//  AppDelegate.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 18/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainController: RecipesTableViewController? {
        var mainViewController: RecipesTableViewController = RecipesTableViewController.new()
        return mainViewController
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window?.rootViewController = self.mainController

        return true
    }
}

