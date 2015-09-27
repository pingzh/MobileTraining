//
//  AppDelegate.swift
//  TipCalculator
//
//  Created by Ping Zhang on 9/26/15.
//  Copyright (c) 2015 Ping Zhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let interval = 10 * 60
    var tipViewController: TipViewController!
    
    func _setUserData() {
        
        if let viewControllers = window?.rootViewController?.childViewControllers {
            for viewController in viewControllers {
                if viewController.isKindOfClass(TipViewController) {
                    println("Found it!!!")
                    tipViewController = viewController as! TipViewController
                    var billAmount = tipViewController.amountInputText.text
                    var tipIndex = tipViewController.tipIndex
                    
                    let userData = NSUserDefaults.standardUserDefaults()
                    userData.setObject(billAmount, forKey: "amountInputText")
                    let date = NSDate()
                    println(date)
                    userData.setObject(date, forKey: "lastTimeAccess")
                    userData.setInteger(tipIndex, forKey: "tipIndex")
                    userData.synchronize()

                }
            }
        }
        
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        self._setUserData()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if let viewControllers = window?.rootViewController?.childViewControllers {
            for viewController in viewControllers {
                if viewController.isKindOfClass(TipViewController) {
                    tipViewController = viewController as! TipViewController
                    self._retrieveUserData()
                }
            }
        }
    }
    
    func _retrieveUserData() {
        
        let userData = NSUserDefaults.standardUserDefaults()
        if let lastTimeAccess: AnyObject = userData.objectForKey("lastTimeAccess") {
            let elapsedTime = NSDate().timeIntervalSinceDate(lastTimeAccess as! NSDate)
            if Int(elapsedTime) < interval {
                let amount = userData.stringForKey("amountInputText")
                let index = userData.integerForKey("tipIndex")
                self.tipViewController.tipIndex = index
                if amount != nil {
                    self.tipViewController.amountInputText.text = amount!
                }
                self.tipViewController.amountInputText.reloadInputViews()
                userData.synchronize()
            }
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

