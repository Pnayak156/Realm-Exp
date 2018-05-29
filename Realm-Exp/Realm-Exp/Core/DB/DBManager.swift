//
//  DBManager.swift
//  Realm-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    
    private let dataBase: Realm
    static let sharedInstance = DBManager()
    private init() {
        dataBase = try! Realm()
    }
    
    func getDataFromDB() -> Results<Item> {
        let results: Results<Item> = dataBase.objects(Item.self)
        return results
    }
    
    func addItem(item: Item) {
        
        try! dataBase.write {
            dataBase.add(item, update: true)
        }
    }
    
    func deleteItem(item: Item)  {
        try! dataBase.write {
            dataBase.delete(item)
        }
    }
    
    func deleteAll()  {
        try! dataBase.write {
            dataBase.deleteAll()
        }
    }
}
