//
//  AppDelegate.swift
//  ZaeemTest
//
//  Created by Abdul Baseer on 06/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
var  arrSeeCodeData = [SeeCode_ModleData]()
var selectedIndex = 0
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        arrSeeCodeData = SeeCode_Data.getData()
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for:UIBarMetrics.default)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]

        UserDefaults.standard.set(false, forKey: "isFirstEnter")
        IQKeyboardManager.sharedManager().enable = true
        self.setupAppearance()
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Setup app appearance
    func setupAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UIApplication.shared.statusBarStyle = .lightContent
        
        let attri_selected = NSDictionary(objects: [UIFont.systemFont(ofSize: 18), UIColor(red: 247/255, green: 93/255, blue: 11/255, alpha: 1.0)], forKeys: [ NSAttributedStringKey.font as NSCopying, NSAttributedStringKey.foregroundColor as NSCopying])
        let attri_normal = NSDictionary(objects: [UIFont.systemFont(ofSize: 18), UIColor.black], forKeys: [ NSAttributedStringKey.font as NSCopying, NSAttributedStringKey.foregroundColor as NSCopying])
        UISegmentedControl.appearance().setTitleTextAttributes(attri_selected as [NSObject : AnyObject] , for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(attri_normal as [NSObject : AnyObject] , for: .normal)
    }

}

