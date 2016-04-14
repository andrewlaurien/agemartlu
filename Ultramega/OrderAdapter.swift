import Foundation
import UIKit

class OrderAdapter{
    
    //MARK:  Variables
    var orderno: String
    var orderdetails: [OrderList]
    
    init(named: String, includeOrder: [OrderList])
    {
        orderno = named
        orderdetails = includeOrder
    }
    
    class func orderDetails() -> [OrderAdapter]
    {
        return [self.getDetails()]
    }
    
    
    // Private methods
    
    private class func getDetails() -> OrderAdapter {
        var orders = [OrderList]()
        
        orders.append(OrderList(orderedno: "09320383", ordereddate: "03-09-16", orderedamount: "P 20.00", imageName: "Pending"))
        orders.append(OrderList(orderedno: "09423343", ordereddate: "03-09-16", orderedamount: "P 40.00", imageName: "Pending"))
        orders.append(OrderList(orderedno: "42320383", ordereddate: "03-09-16", orderedamount: "P 50.00", imageName: "Pending"))
        orders.append(OrderList(orderedno: "42320343", ordereddate: "03-09-16", orderedamount: "P 60.00", imageName: "Pending"))
        
        return OrderAdapter(named: "order", includeOrder: orders)
    }
    
    
    
    
}