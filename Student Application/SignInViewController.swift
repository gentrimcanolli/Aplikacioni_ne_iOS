//
//  SignInViewController.swift
//  Student Application
//
//  Created by TDI Student on 30.8.22.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var emailArray = [String]()
    var passwordArray = [String]()
    

    @IBAction func signInBtn(_ sender: Any) {
        
        let email = emailText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        if (db.checkUser(email: email!, password: password!) == true){
//            showAlert(alertTitle: "Login Successfully", message: "You will be redirected to home page")
//        } else {
//            showAlert(alertTitle: "Login Error", message: "You will be redirected to home page")
//        }
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentDatabase")
//        fetchReq.returnsObjectsAsFaults = false
//
//
//        do{
//                    let results = try context.fetch(fetchReq)
//
//                    for result in results as! [NSManagedObject]{
//                        if let email = result.value(forKey: "email") as? String{
//                            self.emailArray.append(email)
//                        }
//                        if let password = result.value(forKey: "password") as? String{
//                            self.passwordArray.append(password)
//                        }
//
//                    }
//                }
//                catch{
//                    print("error")
//                }
//
//                if (emailArray.contains(emailText.text!)){
//                    let mailIndex = emailArray.firstIndex(where: {$0 == emailText.text})
//
//                    if passwordArray[mailIndex!] == passwordText.text{
//                        //to do navigation
//
//                        showAlert(alertTitle: "Login successfully!", message: "You will be redirected to the main page")
//                    }
//                }
//                else{
//
//                    showAlert(alertTitle: "User not found", message: "This user is not registered!")
//                    // create the alert
//
//            }
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
