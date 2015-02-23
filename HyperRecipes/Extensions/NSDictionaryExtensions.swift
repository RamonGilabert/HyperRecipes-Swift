//
//  NSDictionaryExtensions.swift
//  HyperRecipes
//
//  Created by Christoffer Winterkvist on 23/02/15.
//  Copyright (c) 2015 zenangst. All rights reserved.
//

import Foundation

extension NSDictionary {

    func removeNullValues() -> NSDictionary {
        var mutableDictionary: NSMutableDictionary = self.mutableCopy() as! NSMutableDictionary

        for (key, value) in mutableDictionary {
            if (value.isKindOfClass(NSNull.classForCoder())) {
                mutableDictionary.removeObjectForKey(key);
            }
        }

        return mutableDictionary.copy() as! NSDictionary
    }

}
