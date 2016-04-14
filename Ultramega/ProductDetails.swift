import UIKit

class ProductDetails: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var txtItemName: UILabel!
    @IBOutlet var txtItemCode: UILabel!
    @IBOutlet var txtPackage: UIButton!
    @IBOutlet var txtQuantity: UITextField!
    @IBOutlet var txtAmount: UILabel!
    @IBOutlet var txtTotalAmount: UILabel!
    @IBOutlet var txtItemDescription: UILabel!
    @IBOutlet var ptomoImage: UIImageView!
    
    var ItemID: String = ""
    var ItemName: String = ""
    let dropDown = DropDown()
    var unitPrice : Double = 0.0
    
    var packageslist = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 5, self.txtQuantity.frame.height))
        txtQuantity.leftView = paddingView
        txtQuantity.leftViewMode = UITextFieldViewMode.Always
        
        
        self.loadDetails()
        txtItemCode.text = ItemID
        txtItemName.text = ItemName
        
        txtQuantity.delegate = self
        
        dropDown.dataSource =  packageslist
        
        
        txtPackage.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        dropDown.selectionAction = { [unowned self] (index, item) in
            self.txtPackage.setTitle(item, forState: .Normal)
        }
        dropDown.anchorView = txtPackage
        dropDown.bottomOffset = CGPoint(x: 0, y:txtPackage.bounds.height)
        txtPackage.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        txtPackage.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 0.0)
        txtPackage.backgroundColor = UIColor.clearColor()
        txtPackage.layer.cornerRadius = 1
        txtPackage.layer.borderWidth = 1
        txtPackage.layer.borderColor = UIColor.blackColor().CGColor
        
        txtQuantity.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
    }
    
    // MARK : Actions
    @IBAction func PackageDropdown(sender: UIButton) {
        if dropDown.hidden {
            dropDown.show()
        } else {
            dropDown.hide()
        }
    }
    
    
    @IBAction func viewTapped() {
        view.endEditing(false)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
        let maxLength = 4
        let currentString: NSString = txtQuantity.text!
        let newString: NSString =
        currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }
    
    
    func textFieldDidChange(textField: UITextField) {
        if(txtQuantity.text != ""){
        let totalamount = unitPrice * Double(txtQuantity.text!)!
        txtTotalAmount.text = "P \(String(format: "%.2f",totalamount))"
        }
    }
    
    func loadDetails() {
        
        
        let db = ModelManager.getInstance().database!
        
        db.open()
        
        let results = db.executeQuery("SELECT * FROM Items Where ItemCode= ?", withArgumentsInArray: [ItemID])
        
        if (results != nil) {
            while results.next()
            {
                
                packageslist.append(results.stringForColumn("Package"))
                
                txtAmount.text = "P \(String(format: "%.2f", Double(results.stringForColumn("Price"))!))"
                txtTotalAmount.text = "P \(String(format: "%.2f", Double(results.stringForColumn("Price"))!))"
                unitPrice = Double(results.stringForColumn("Price"))!
                
                txtItemDescription.text = "\(results.stringForColumn("ItemDescription"))"
                
                
                
                if(results.stringForColumn("isPromo") == "0"){
                    ptomoImage.hidden = true
                }
                
            }
        }
        db.close()
        
        
    }
    
    
}
