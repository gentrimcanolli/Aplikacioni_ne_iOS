import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var loanAmount: UITextField!
    @IBOutlet weak var months: UITextField!
    @IBOutlet weak var interestRate: UITextField!
    @IBOutlet weak var monthlyTotalLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        calculateLoan()
    }
    
    func calculateLoan(){
        //    PV - loan amount
        //    PMT - monthly payment
        //    i - interest rate per month
        //    n - number of months
        
        if (loanAmount.text! == "" || months.text! == "" || interestRate.text! == ""   ){
            showAlert(alertTitle: "Missing Fields", message: "All fields are required!")
        }
        
        let pv = Double (loanAmount.text!) ?? .zero
        let n = Double (months.text!) ?? .zero
        let i = Double (interestRate.text!) ?? .zero
        
        let rate = i / 100 / 12
        let pmt = pv * rate / (1 - pow(1 + rate, -n))
        
        let total = pmt * n
        
        monthlyTotalLabel.text = String(format:"%@%.2f%@%", "Monthly total: ", pmt, "€")
        
        totalLabel.text =  String(format:"%@%.2f%@%", "Total: ", total, "€")
    }
    
    func showAlert(alertTitle:String, message:String){
        let alert = UIAlertController(title: alertTitle, message:  message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            UIAlertAction in
            self.dismiss(animated: true, completion: nil)
            
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

