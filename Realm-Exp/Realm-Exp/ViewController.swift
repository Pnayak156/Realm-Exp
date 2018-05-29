//
//  ViewController.swift
//  Realm-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellItedendifier")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getDataFromDB().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellItedendifier", for: indexPath)
        let item: Item = DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item
        cell.textLabel?.text = item.textString
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: TodoUpdateViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateVC") as! TodoUpdateViewController
        
        vc.currentItem = DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

