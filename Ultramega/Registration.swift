//
//  Registration.swift
//  Ultramega
//
//  Created by Vera Mae Piollo on 07/03/2016.
//  Copyright © 2016 PayVenue Corp. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    @IBOutlet var txtLastName: UITextField!
    @IBOutlet var txtFirstName: UITextField!
    @IBOutlet var txtMiddleName: UITextField!
    @IBOutlet var txtStoreName: UITextField!
    @IBOutlet var txtEmailAddress: UITextField!
    
    var marrCustData : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.getStudentData()
    }
    

    // MARK: - Actions
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
  
    @IBAction func btnSubmit(sender: UIButton) {
        
        
        let registerInfo: RegistrationInfo = RegistrationInfo()
        registerInfo.LastName = txtLastName.text!
        registerInfo.FirstName = txtFirstName.text!
        registerInfo.MiddleName = txtMiddleName.text!
        registerInfo.StoreName = txtStoreName.text!
        registerInfo.EmailAddress = txtEmailAddress.text!
        
        let isUpdated = ModelManager.getInstance().insertCustomerData(registerInfo)
        if isUpdated {
            Util.invokeAlertMethod("", strBody: "Record inserted successfully.", delegate: nil)
        } else {
            Util.invokeAlertMethod("", strBody: "Error in updating record.", delegate: nil)
        }

        
    }

    @IBAction func btnRetrieved(sender: UIButton) {
        
      //  marrCustData = NSMutableArray()
     //   marrCustData = ModelManager.getInstance().getAllCustomerData()
        //txtLastName.reloadData()
        
        
        
        ModelManager.getInstance().database!.open()
        
        let results = ModelManager.getInstance().database!.executeQuery("SELECT * FROM CustomerProfile Where CustomerID=\("2222")", withArgumentsInArray: [])
        while results.next()
        {
            txtLastName.text = results.stringForColumn("LastName")
            txtFirstName.text = results.stringForColumn("FirstName")
            txtMiddleName.text = results.stringForColumn("MiddleName")
        }
        
        ModelManager.getInstance().database!.close()

    }
 
    
}
