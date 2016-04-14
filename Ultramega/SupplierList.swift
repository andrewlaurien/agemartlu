
import UIKit

class SupplierList {
    
    var supplierid: String
    var suppliername: String
    
    
    convenience init()
    {
        self.init(suppid: "", suppname: "")
    }
    
    init(suppid: String, suppname: String)
    {
        self.supplierid = suppid
        self.suppliername = suppname
        
    }
    
    class func listSupplier() -> [SupplierList]
    {
        var suppliers = [SupplierList]()
        
        let db = ModelManager.getInstance().database!
        
        db.open()
        
        let results = db.executeQuery("SELECT * FROM SupplierList", withArgumentsInArray: [])
        
        while results.next()
        {
            let supplier = SupplierList()
            supplier.supplierid = results.stringForColumn("SupplierID")
            supplier.suppliername = results.stringForColumn("SupplierName")
            
            suppliers.append(supplier)
        }
        
        db.close()
        
        return suppliers
    }

}
 