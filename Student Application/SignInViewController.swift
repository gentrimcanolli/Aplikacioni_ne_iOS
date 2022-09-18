//
//  SignInViewController.swift
//  Student Application
//
//  Created by TDI Student on 30.8.22.
//

import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var db = DbHelper()
    var users = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.createTableStudent()
    
    }
    

    @IBAction func signInBtn(_ sender: Any) {
        
        
        
        let email = String(emailText.text!)
        let password = String(passwordText.text!)
        
        users = db.checkUser(email: email, password: password)
        
        for user in users{
            if (user.email == email && user.password == password) {
                _ = self.navigationController?.pushViewController(HomePageViewController(), animated: true)
                print("Successfully logged in!")
            } else{
                showAlert(alertTitle: "SignIn Failed!", message: "Wrong credentials!")
                print("Error login ")
                
            }
        }
        }
        
    
        
        @IBAction func signUpBtn(_ sender: Any) {
            
        }
        
        func showAlert(alertTitle:String, message:String){
            let alert = UIAlertController(title: alertTitle, message:  message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
                UIAlertAction in
                _ = self.navigationController?.popViewController(animated: true)
                
            }
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
