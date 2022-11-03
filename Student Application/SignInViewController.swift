import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var db = DbHelper()
    var users = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
        let email = emailText.text!
        let password = passwordText.text!
        
        if (email.isEmpty && password.isEmpty){
            showAlert(alertTitle: "Missing Fields", message: "All field are required!")
        }else if (checkUsers(email:email,password:password)) { print("Successfully logged in!")
            
            emailText.text = ""
            passwordText.text = ""
            
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController

            homeVC.email = email
            
            self.navigationController?.pushViewController(homeVC, animated: true)
            
        } else{
            showAlert(alertTitle: "Login Failed!", message: "Wrong credentials")
        }
    }
    
    func checkUsers(email: String, password: String) -> Bool{
        users = db.readUser()
        var check = false
        for student in users{
            if (student.email == email && student.password == password) {
                check = true
            }
        }
        return check
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        
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
