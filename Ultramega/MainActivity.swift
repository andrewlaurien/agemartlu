import UIKit

class MainActivity: UIViewController {
    
    
    //MARK : Properties
    var statusLabel : String! = nil
    @IBOutlet var LabelStat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelStat.text = statusLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation


}
