 import UIKit

class Pending: UIViewController,UINavigationControllerDelegate {
    
    //MARK : Properties
    
    var status :Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        if(status){
         performSegueWithIdentifier("mainactivity", sender: nil)
        }
    }

 
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
 
    // MARK: - Navigation
    

}
