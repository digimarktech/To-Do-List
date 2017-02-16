//
//  FirstViewController.swift
//  To Do List
//
//  Created by Marc Aupont on 12/11/15.
//  Copyright © 2015 Digimark. All rights reserved.
//

import UIKit

//This line defines the toDoList array that takes value types of "String" and is currently empty
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var toDoListTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This will check to ensure we have data in toDoList before trying to store to Device
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil) {
        
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String] //load saved data into array
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This piece of code allows the number of cells to be based on the number of items in the toDoList array
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
    }
    
    //This piece of code writes each item to each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    //This function handles the ability to swipe to the left to delete table items
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //check if user chose to delete
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)//delete item from array
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")//delete item from permanent storage
            
            toDoListTable.reloadData()//refresh elements of array on screen
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData() 
    }


}

