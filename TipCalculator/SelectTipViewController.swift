//
//  SelectTipViewController.swift
//  TipCalculator
//
//  Created by Ping Zhang on 9/26/15.
//  Copyright (c) 2015 Ping Zhang. All rights reserved.
//

import UIKit

class SelectTipViewController: UIViewController {

    var defaultTipIndex: Int = 0
    var tips: [Float] = [0.10, 0.15, 0.20, 0.25]
    
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    @IBAction func setDefaultTip(sender: UISegmentedControl) {
        self.defaultTipIndex = tipSelector.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
