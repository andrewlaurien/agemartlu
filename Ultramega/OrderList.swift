

import Foundation
import UIKit

class OrderList {
    
    
    var orderno: String
    var orderdate: String
    var totalamount : String
    var orderstatus: String
    var image: UIImage
    
    init(orderedno: String, ordereddate: String, orderedamount: String,imageName: String)
    {
        self.orderno = orderedno
        self.orderdate = ordereddate
        self.totalamount = orderedamount
        self.orderstatus = imageName
        if let img = UIImage(named: imageName) {
            image = img
        } else {
            image = UIImage(named: "default")!
        }
      
    }
    
    
}
