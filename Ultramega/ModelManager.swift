import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath("ultramega_app"))
        }
        return sharedInstance
    }
    
    func insertCustomerData(custInfo: RegistrationInfo) -> Bool {
        
        var success: Bool
        
        sharedInstance.database!.open()
          
        //success = sharedInstance.database!.executeUpdate("UPDATE CustomerProfile SET LastName=?, MiddleName=? WHERE CustomerID=?", withArgumentsInArray: [custInfo.LastName, custInfo.MiddleName, "2222"])
 
           success = sharedInstance.database!.executeUpdate("INSERT INTO CustomerProfile (LastName, MiddleName, FirstName, Company, EmailAddress) VALUES (?, ?, ?, ?, ?)", withArgumentsInArray: [custInfo.LastName, custInfo.MiddleName, custInfo.FirstName, custInfo.StoreName, custInfo.EmailAddress])
        
        sharedInstance.database!.close()
        
        return success
       }
     
    }

    
    func getAllCustomerData() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM CustomerProfile", withArgumentsInArray: nil)
        let marrCustInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let custInfo : RegistrationInfo = RegistrationInfo()
                custInfo.LastName = resultSet.stringForColumn("LastName")
                custInfo.MiddleName = resultSet.stringForColumn("MiddleName")
                custInfo.FirstName = resultSet.stringForColumn("FirstName")
                marrCustInfo.addObject(custInfo)
            }
        }
        sharedInstance.database!.close()
        return marrCustInfo
    }
    

