import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!

    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(email)"
    }
    
    @IBAction func loanBtn(_ sender: Any) {
        
    }
    
    @IBAction func subjectsButton(_ sender: Any) {
        
    }
}

