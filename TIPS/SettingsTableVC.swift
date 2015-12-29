//
//  SettingsTableVC.swift
//  TIPS
//
//  Created by Joshua Choi on 12/29/15.
//  Copyright © 2015 Josh M. Choi. All rights reserved.
//

import UIKit

class SettingsTableVC: UITableViewController, UITextFieldDelegate {
    
    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

/*    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier == "detailView") {
            var vc = segue.destinationViewController as DetailViewController
            vc.img = selectedImage
            vc.lblDetail = selectedLabel
        }
    }
  */

    // SAVE UPDATED CHANGES
    @IBOutlet weak var updateChanges: UIBarButtonItem!
    @IBAction func updateChanges(sender: AnyObject) {
        /*
        func prepareForSeuge(segue: UIStoryboardSegue, sender: AnyObject) {
            if (segue.identifier == "toViewController") {
                var vc = segue.destinationViewController as! ViewController
                
                let newFirstSegment = firstSegment.text
                let newSecondSegment = secondSegment.text
                let newThirdSegment = thirdSegment.text
                
                let theSelectedTip = vc.segmentOfTips.selectedSegmentIndex
                
                switch theSelectedTip {
                case 1:
                    vc.segmentOfTips.setTitle(newFirstSegment, forSegmentAtIndex: 0)
                case 2:
                    vc.segmentOfTips.setTitle(newSecondSegment, forSegmentAtIndex: 1)
                case 3:
                    vc.segmentOfTips.setTitle(newThirdSegment, forSegmentAtIndex: 2)
                default:
                    vc.segmentOfTips.setTitle("18%", forSegmentAtIndex: 0)
                    vc.segmentOfTips.setTitle("20%", forSegmentAtIndex: 1)
                    vc.segmentOfTips.setTitle("2%", forSegmentAtIndex: 2)
                }
            }
        }
        */
        self.performSegueWithIdentifier("toViewController", sender: self)
        
    }
    @IBOutlet weak var firstSegment: UITextField!
    @IBOutlet weak var secondSegment: UITextField!
    @IBOutlet weak var thirdSegment: UITextField!
    
    @IBOutlet weak var disableDivision: UISwitch!
    
    @IBAction func accessSystemPreferences(sender: AnyObject) {
        var alertController = UIAlertController (title: "Go to settings?",
            message: "Are you sure you would like to change your TipCalculator's preferences?",
            preferredStyle: .Alert)
        
        var yesAction = UIAlertAction(title: "Yes", style: .Default) { (_) -> Void in
            let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
            if let url = settingsUrl {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        
        var cancelAction = UIAlertAction(title: "No", style: .Default, handler: nil)
        
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // updateChanges.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // ================================== MARK: - Table view data source =========================================================
    // SET PROPERTIES FOR UITABLEVIEW AND UITABLEVIEWCELLS
    let tableViewSectionCount: Int = 2
    let setTipSection: Int = 0
    let setOptionSection: Int = 1
    
    // SET NUMBER OF SECTIONS IN TABLEVIEW
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    // SET NUMBER OF ROWS PER SECTION
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case setTipSection:
            return 3
        case setOptionSection:
            return 2
        default:
            return 0
        }
    }
    
    
    // RETURN TITLE OF SECTION
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case setTipSection:
            return "Set Tips"
        case setOptionSection:
            return "Set Options"
        default:
            return "Not Available"
        }
    }

    // CUSTOMIZE CONFIGURATION OF UITABLEVIEWCELLS
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellEighteen = tableView.dequeueReusableCellWithIdentifier("eighteen", forIndexPath: indexPath) as! UITableViewCell
        let cellTwenty = tableView.dequeueReusableCellWithIdentifier("twenty", forIndexPath: indexPath) as! UITableViewCell
        let cellTwentyTwo = tableView.dequeueReusableCellWithIdentifier("twentyTwo", forIndexPath: indexPath) as! UITableViewCell
        
        let cellDisableDivision = tableView.dequeueReusableCellWithIdentifier("disableDivision", forIndexPath: indexPath) as! UITableViewCell
        let cellAccessPreferences = tableView.dequeueReusableCellWithIdentifier("accessSystemPreferences", forIndexPath: indexPath) as! UITableViewCell
        
        return cellEighteen
        return cellTwenty
        return cellTwentyTwo
        
        return cellDisableDivision
        return cellAccessPreferences
    }
    */
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }



}
