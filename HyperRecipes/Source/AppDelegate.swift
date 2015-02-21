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

    var navigationController: UINavigationController {
        var aNavigationController = UINavigationController.new()
        aNavigationController.addChildViewController(mainController)

        return aNavigationController
    }

    var mainController: RecipesTableViewController {
        return RecipesTableViewController.new()
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()

        return true
    }
}

