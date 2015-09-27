//
//  NavigationController.swift
//  TipCalculator
//
//  Created by Ping Zhang on 9/26/15.
//  Copyright (c) 2015 Ping Zhang. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add Groupon Green to navigationBar
        let grouponGreen = UIColor(red: 120/255, green: 181/255, blue: 72/255, alpha: 1)
        self.navigationBar.barTintColor = grouponGreen
        //self.navigationItem.rightBarButtonItem?.tintColor = grouponGreen
        //self.navigationItem.leftBarButtonItem?.tintColor = grouponGreen
        self.navigationBar.tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    }
}
