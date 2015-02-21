//
//  Networking.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 19/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit
import Alamofire

private let _SharedInstance = Networking()

class Networking: NSObject {

    let baseURL = "http://hyper-recipes.herokuapp.com"

    class var sharedInstance: Networking {
        return _SharedInstance
    }

    override init() {
        super.init()
    }

    func getRecipes() -> NSDictionary? {

        Alamofire.request(.GET, "\(baseURL)/recipes", parameters: nil)
            .responseJSON { (_, _, JSON, _) in
                println(JSON)
        }

        return nil
    }

}
