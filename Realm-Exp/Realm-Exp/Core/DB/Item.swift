//
//  Item.swift
//  Realm-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit
import RealmSwift

class Item: Object {
     @objc dynamic var ID = 0
     @objc dynamic var textString = ""
    
    @objc open override class func primaryKey() -> String? { return "ID" }
}
