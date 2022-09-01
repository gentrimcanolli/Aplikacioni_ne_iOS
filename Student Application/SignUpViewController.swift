//
//  SignUpViewController.swift
//  Student Application
//
//  Created by TDI Student on 31.8.22.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var emailArray = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let firstName = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        let lastName = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        let email = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        let password = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
    
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentDatabase")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let email = result.value(forKey:"email") as? String{
                    self.emailArray.append(email)}
            }
        }catch {
            print("Error")
        }
        
        
        if(emailArray.contains(emailTF.text!)){
            showAlert(alertTitle:"Account Exists", message:"This account already exists!")
        } else{
            firstName.setValue(self.firstNameTF.text, forKey: "firstName")
            lastName.setValue(self.lastNameTF.text, forKey: "lastname")
            email.setValue(self.emailTF.text, forKey: "email")
            password.setValue(self.passwordTF.text, forKey: "password")
            showAlert(alertTitle: "Signup", message: "Successfully Registered!")
            
        }
        
    
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
    
    @IBAction func signInButton(_ sender: Any) {
    
    
    
    }
    
    
    

}
