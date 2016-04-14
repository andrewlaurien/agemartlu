//
//  ItemList.swift
//  Ultramega
//
//  Created by Vera Mae Piollo on 16/03/2016.
//  Copyright © 2016 PayVenue Corp. All rights reserved.
//

import UIKit

class ItemList {
 
    var itemname: String
    var itemcode: String
 
    convenience init()
    {
        self.init(itemid: "", itemdescrip: "")
    }
    
    
    init(itemid: String, itemdescrip: String)
    {
        self.itemcode = itemid
        self.itemname = itemdescrip
        
    }
    
    class func listItems(suppid : String) -> [ItemList]
    {
        var items = [ItemList]()
        
        let db = ModelManager.getInstance().database!
        
        db.open()
        
        let results = db.executeQuery("SELECT * FROM Items Where SupplierName= ?", withArgumentsInArray: [suppid])
        
        if (results != nil) {
          while results.next()
           {
            let item = ItemList()
            
            item.itemname = results.stringForColumn("ItemName")
            item.itemcode = results.stringForColumn("ItemCode")
            
            items.append(item)
           }
        }
        db.close()
         
        
        return items
    }
    
    
}
