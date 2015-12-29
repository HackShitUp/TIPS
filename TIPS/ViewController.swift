//
//  ViewController.swift
//  TIPS
//
//  Created by Joshua Choi on 12/28/15.
//  Copyright © 2015 Josh M. Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func dismissKeyboard(sender: AnyObject) {
        self.amountDue.resignFirstResponder()
    }
    
    
    @IBOutlet weak var amountDue: UITextField!
    
    @IBAction func amountDue(sender: AnyObject) {
        self.resignFirstResponder()
        // (1 & 2)
        // Error1: Syntax var name: Int? = Int(name2.text!) cannot be applied to opernds of type 'Int' to 'Double'
        var intOfBill: Double? = Double(amountDue.text!)
        
        // (3)
        let theSelectedTip = segmentOfTips.selectedSegmentIndex
        
        // (4) Switch statement
        // (5) Return amount of tip
        // (6) Return amount of total
        
        switch theSelectedTip {
        case 1:
            let tip20 = intOfBill! * 0.20
            let totalAt20 = tip20 + intOfBill!
            
            amountOfTip.text = String(format:"$%.2f", tip20)
            totalDueWithTip.text = String(format: "$%.2f", totalAt20)
            
        case 2:
            let tip22 = intOfBill! * 0.22
            let totalAt22 = tip22 + intOfBill!
            
            amountOfTip.text = String(format:"$%.2f", tip22)
            totalDueWithTip.text = String(format: "$%.2f", totalAt22)
            
        default :
            let tip18 = intOfBill! * 0.18
            let totalAt18 = tip18 + intOfBill!
            
            amountOfTip.text = String(format:"$%.2f", tip18)
            totalDueWithTip.text = String(format:"$%.2f", totalAt18)
        }
        
        // (1) Get String from textfield                    √
        // (2) Convert String to Int                        √
        // (3) Get selected UISegment Index                 √
        // (4) Calculate Tip based on UISegment Index       √
        // (5) Return amount of tip                         √
        // (6) Return total w/tip                           √
    }
    
    
    @IBAction func slideNumberOfPeople(sender: AnyObject) {
        // Get integer value of slider
        // splitCheckWithOthers
        let currentValue = Int(slideNumberOfPeople.value)
        splitCheckWithOthers.text = "Split check amongst \(currentValue) people"
        
        var intOfBill: Double? = Double(amountDue.text!)
        
        
        let theSelectedTip = segmentOfTips.selectedSegmentIndex
        
        switch theSelectedTip {
        case 1:
            let tip20 = intOfBill! * 0.20
            let totalAt20 = tip20 + intOfBill!
            let totalAt20Splitted = totalAt20 / Double(Int(slideNumberOfPeople.value))
            
            divisionOfCheck.text = String(format: "$%.2f", totalAt20Splitted)
        case 2:
            let tip22 = intOfBill! * 0.22
            let totalAt22 = tip22 + intOfBill!
            let totalAt22Splitted = totalAt22 / Double(Int(slideNumberOfPeople.value))
            
            divisionOfCheck.text = String(format: "$%.2f", totalAt22Splitted)
        
         default:
            let tip18 = intOfBill! * 0.18
            let totalAt18 = tip18 + intOfBill!
            let totalAt18Splitted = totalAt18 / Double(Int(slideNumberOfPeople.value))
            
            divisionOfCheck.text = String(format: "$%.2f", totalAt18Splitted)
        }
        
        
        
    }
    
    // UISegmentedControler
    @IBOutlet weak var segmentOfTips: UISegmentedControl!
    // Amount of tip
    @IBOutlet weak var amountOfTip: UILabel!
    // Total of bill
    @IBOutlet weak var totalDueWithTip: UILabel!
    // Show number of people via UISlider
    @IBOutlet weak var splitCheckWithOthers: UILabel!
    @IBOutlet weak var slideNumberOfPeople: UISlider!
    // Amount each person pays TEXT
    @IBOutlet weak var divisionOfCheck: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        amountOfTip.text = "$0.00"
        totalDueWithTip.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

