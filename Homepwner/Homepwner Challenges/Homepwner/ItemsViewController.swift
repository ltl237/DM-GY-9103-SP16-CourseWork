//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Lorenzo Llamas on 2/28/16.
//  Copyright © 2016 FinesseFilm Productions. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
//    @IBAction func toggleEditingMode(sender: AnyObject) {
//        // if you are currently in editing mode
//        if editing {
//            //change text of button to inform user of state
//            sender.setTitle("Edit", forState: .Normal)
//        //turn off editing mode
//            setEditing(false, animated: true)
//        }
//        else {
//            //change text of button  to inform user of state
//            sender.setTitle("Done", forState: .Normal)
//            
//            //enter editing mode
//            setEditing(true, animated: true)
//        }
//    }
//    
//    @IBAction func addNewItem(sender: AnyObject) {
//        //Make new index path
////        let lastRow = tableView.numberOfRowsInSection(0)
////        let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
////        
////        // Insert this new row into the table
////        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        //create a new item and add it to the store 
//        let newItem = itemStore.createItem()
//        
//        //figure out where that item is in the array 
//        if let index =  itemStore.allItems.indexOf(newItem) {
//            let indexPath =  NSIndexPath(forRow: index, inSection: 0)
//            
//            //insert this new row into the table
//            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        }
//    }
    

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return itemStore.lessthan.count
        }
        else {
            return itemStore.morethan.count
        }
//        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Less than $50"
        }
        else {
            return "Greater than $50"
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
//    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//        //update the model
//        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
//    }
//    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        //if the table view is asking to commit a delete command
//        if editingStyle == .Delete {
//            let item = itemStore.allItems[indexPath.row]
//            
//            let title = "Delete \(item.name)?"
//            let message = "Are you sure you want to delete this item?"
//            
//            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//            ac.addAction(cancelAction)
//            
//            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: { (action) -> Void in
//            //remove the item from the store
//            self.itemStore.removeItem(item)
//            
//            //also remove that row from the table view with an animation
//            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        })
//            ac.addAction(deleteAction)
//            //present the alert controller
//            presentViewController(ac, animated: true, completion: nil)
//    }
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        //Get a new or recycled cell
        //create an  instance  of UITableviewcell,  with default appearance
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        //Update the labels for new preferred text size
        cell.updateLabels()
        //set the text on the cell 
        //let item = itemStore.allItems[indexPath.row]
        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        if indexPath.section == 0 {
            
            let lastRow = itemStore.lessthan.count-1
            cell.nameLabel.text = itemStore.lessthan[indexPath.row].name
            if lastRow != itemStore.lessthan.count-1 {
                cell.valueLabel.text = "$\(itemStore.lessthan[indexPath.row].valueInDollars)"

            }
        }
        else {
            let lastRow = itemStore.morethan.count-1
            cell.nameLabel.text = itemStore.morethan[indexPath.row].name
            if lastRow != itemStore.morethan.count-1 {
            cell.valueLabel.text = "$\(itemStore.morethan[indexPath.row].valueInDollars)"
            }
        }
        
//        cell.nameLabel.text = item.name
//        cell.serialNumberLabel.text = item.serialNumber
//        cell.valueLabel.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
//        tableView.rowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
}

