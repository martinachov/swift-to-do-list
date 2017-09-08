//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Martin Vacas on 8/9/17.
//  Copyright © 2017 Martin Vacas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var itemText: UITextField!
    
    @IBAction func add(_ sender: UIButton) {
        let itemObject = UserDefaults.standard.object(forKey: "items")
        var items: Array<String>
        
        if let text = itemText.text {
            if let tempItems = itemObject as? Array<String> {
                items = tempItems
                items.append(text)
            } else {
                items = [itemText.text!]
                
            }
            UserDefaults.standard.set(items, forKey: "items")
            itemText.text = ""
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        itemText.resignFirstResponder()
        return true
    }


}

