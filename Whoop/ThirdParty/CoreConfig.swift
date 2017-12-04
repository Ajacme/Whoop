//
//  CoreConfig.swift
//  CllearWorksCoreKit
//
//  Created by ACME Dev
//  Copyright (c) 2015 ACME. All rights reserved.
//

import Foundation

public class CoreConfig {
    
    let defaults = UserDefaults.standard
    let selectedAppMap = UserDefaults.standard.object(forKey: "SelectedAppMap")
    
    public static let sharedInstance = CoreConfig()
    private init() {}
    
    
    public func objectForPlistKey(key:String) -> AnyObject {
        return Bundle.main.object(forInfoDictionaryKey: key)! as AnyObject
    }
  
}


// MARK - Properties
extension CoreConfig {

    public func current() -> String {
        return UserDefaults.standard.string(forKey: "current") ?? ""
    }
    public func currentClientId() -> Int {
        return UserDefaults.standard.integer(forKey: "currentClientId")
    }

    public func isUserActive() -> Bool {
        return UserDefaults.standard.bool(forKey: "isActive")
    }
    public func isFirstEnter() -> Bool {
        return  UserDefaults.standard.bool(forKey: "isFirstEnter")
    }
}
