//
//  TodoUpdateViewController.swift
//  Realm-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class TodoUpdateViewController: UIViewController, UITextFieldDelegate {
    
    var currentItem: Item?

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = currentItem {
            textField.text = item.textString
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let text = textField.text else {
            return
        }
        
        let item = Item()
        
        if let curItem = currentItem {
            item.ID = curItem.ID
        } else {
            item.ID = DBManager.sharedInstance.getDataFromDB().count

        }
        item.textString = text
        DBManager.sharedInstance.addItem(item: item)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        if let item = currentItem {
            DBManager.sharedInstance.deleteItem(item: item)
            self.navigationController?.popViewController(animated: true)

        }
    }
    
}
