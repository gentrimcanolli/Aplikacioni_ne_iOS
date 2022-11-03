import UIKit
import CoreData
import SQLite3

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var db = DbHelper()
    var emailArray = [Students]()
    var students = Array<Students>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.createTableStudent()
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let firstName = firstNameTF.text
        let lastName = lastNameTF.text
        let email = emailTF.text
        let password = passwordTF.text
        
        if((firstName?.isEmpty)! || (lastName?.isEmpty)! || (email?.isEmpty)! || (password?.isEmpty)!){
            showAlert(alertTitle: "Missing Fields", message: "All fields are required!",actionId: 1)
            return
        }else if (password?.count ?? 0 < 8){
            showAlert(alertTitle: "Check password", message: "Your password must contain 8 or more letters",actionId: 1)
        } else if (emailValidation(email: email!) == false){
            showAlert(alertTitle: "Check email", message: "Invalid form of email",actionId: 1)
        }
        else if (checkUsers(email: email!) == true){
            showAlert(alertTitle: "User Exists", message: "This user already exists",actionId: 1)
        }
        else {
            db.insertStudent(firstname: firstName!, lastname: lastName!, email: email!, password: password!)
            
            showAlert(alertTitle: "Register successful", message: "You are registered",actionId: 2)
        }
    }
    
    func emailValidation(email: String) -> Bool{
        var returnVal = true
        let regexEmail = "[A-Z0-9a-z.-_]+@[student].[a-zA-Z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: regexEmail)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: _NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnVal = false
            }
        }
        catch _ as NSError{
            print("regex error!")
            returnVal = false
        }
        
        return returnVal
    }
    
    func checkUsers(email: String) -> Bool{
        emailArray = db.readUser()
        var check = false
        for studentEmail in emailArray{
            if (studentEmail.email == email) {
                check = true
            }
        }
        return check
    }
    
    func showAlert(alertTitle:String, message:String, actionId: Int){
        let alert = UIAlertController(title: alertTitle, message:  message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            UIAlertAction in
            if (actionId == 1){
                self.dismiss(animated: true, completion: nil)
            }else if (actionId == 2){
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
