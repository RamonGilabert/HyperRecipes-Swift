//
//  Networking.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 19/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import UIKit

private let _SharedInstance = Networking()

class Networking: NSObject {
    class var sharedInstance: Networking {
        return _SharedInstance
    }

    override init() {
        super.init()
    }
}
