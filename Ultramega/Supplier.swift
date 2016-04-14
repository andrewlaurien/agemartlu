//
//  Supplier.swift
//  Ultramega
//
//  Created by Vera Mae Piollo on 16/03/2016.
//  Copyright © 2016 PayVenue Corp. All rights reserved.
//

import UIKit

class Supplier: UITableViewController {
    
    var supplierlist = [SupplierList]()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadSupplier()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return supplierlist.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("suppliercell", forIndexPath: indexPath)
        
         //Configure the cell...
        let details = supplierlist[indexPath.row]
        cell.textLabel?.text = details.suppliername
        cell.detailTextLabel?.text = details.supplierid
        
        cell.detailTextLabel?.hidden = true
        
        return cell
    }
    
    
    //MARK : Actions
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        let DestViewController = segue.destinationViewController as! Item
        
        let details = supplierlist[indexPath.row]
        
        DestViewController.SupplierID = details.suppliername
          
        
    }
    
    
    func loadSupplier() {
        
        self.supplierlist = SupplierList.listSupplier()
        self.tableView.reloadData()
         
    
    }

}
