//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ping Zhang on 9/26/15.
//  Copyright (c) 2015 Ping Zhang. All rights reserved.
//

import UIKit



class TipViewController: UIViewController, UITextFieldDelegate {

    //variables, default to dollar
    var currency: String!
    var tipPercent: Float!
    var tipIndex: Int! = 0
    var tips: [Float]!
    
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var finalTipAmount: UILabel!
    @IBOutlet weak var finalBillAmount: UILabel!
    @IBOutlet weak var amountInputText: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    @IBAction func clearData(sender: UIBarButtonItem) {
        let userData = NSUserDefaults.standardUserDefaults()
        for key in userData.dictionaryRepresentation().keys {
            userData.removeObjectForKey(key.description)
        }
        self.tipIndex = 0
        self.tipSelector.selectedSegmentIndex = 0
        self.amountInputText.text = nil
        self.reloadInputViews()
    }
    
    @IBAction func amountInputTextChanged(sender: AnyObject) {
        self._updateValues()
    
    }
    
    @IBAction func setDefaultTipPercent(segue: UIStoryboardSegue) {
        if let setDefaultTipController = segue.sourceViewController as? SelectTipViewController {
            self.tipIndex = setDefaultTipController.defaultTipIndex
            self.tipSelector.selectedSegmentIndex = tipIndex
            
            self._updateValues()
        }
    }
    
    @IBAction func tipAmountSelector(sender: UISegmentedControl) {
        self.tipIndex = tipSelector.selectedSegmentIndex
        self._updateValues()
    }
    
    func _load() {
        self.currency = "$"
        self.tipIndex = 0
        tips = [0.10, 0.15, 0.20, 0.25]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._load()
        self._updateValues()
    }
    
    override func viewDidAppear(animated: Bool) {
        amountInputText.delegate = self
        amountInputText.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
/*****************************************************************/
    
    func _updateValues() {
        var tip: Float = self._calculateTip()
        finalTipAmount.text = currency + tip.twoDecimal
        
        var finalAmount: Float = amountInputText.text!.floatValue + tip
        finalBillAmount.text = currency + finalAmount.twoDecimal
        self.tipSelector.selectedSegmentIndex = self.tipIndex
    }
    
    
    func _calculateTip() -> Float {
        if let billAmount = amountInputText.text {
            return self.tips[self.tipIndex] * billAmount.floatValue
        }
        return 0
    }

}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension Float {
    var twoDecimal: String {
        return (NSString(format:"%.2f", self) as String)
    }
}

