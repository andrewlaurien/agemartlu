import UIKit

class Item: UITableViewController{
    
    
    var itemlist = [ItemList]()
    var SupplierID:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad() 
         self.loadItem() 
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemlist.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("itemcell", forIndexPath: indexPath) as UITableViewCell
        
        
        let details = itemlist[indexPath.row]
        cell.textLabel?.text = details.itemname
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        let DestViewController = segue.destinationViewController as! ProductDetails
        
        let details = itemlist[indexPath.row]
        
        DestViewController.ItemID = details.itemcode
         DestViewController.ItemName = details.itemname
     
        
        
    }
    
    
    func loadItem() {
        
        self.itemlist = ItemList.listItems(SupplierID)
        self.tableView.reloadData()
        
        
    }

}
