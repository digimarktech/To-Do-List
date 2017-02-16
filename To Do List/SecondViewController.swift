//
//  SecondViewController.swift
//  To Do List
//
//  Created by Marc Aupont on 12/11/15.
//  Copyright © 2015 Digimark. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var userInput: UITextField!
    
    @IBAction func addItemButton(sender: AnyObject) {
        
        if userInput.text != "" {
        
            //This entry adds whatever the user inputs into the toDoList array
            toDoList.append(userInput.text!)
            
            //This line clears the entry so the user can add more items
            userInput.text = ""
            
            //This writes the entries into permanent storage
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This is the code that allows user to tap outside of the keyboard to close the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        userInput.resignFirstResponder()
        
        return true 
    }


}

