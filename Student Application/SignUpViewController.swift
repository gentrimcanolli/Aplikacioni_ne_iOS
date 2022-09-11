//
//  SignUpViewController.swift
//  Student Application
//
//  Created by TDI Student on 31.8.22.
//

import UIKit
import CoreData
import SQLite3

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    var db = DbHelper()
    
    var emailArray = [String]()
    var students = Array<Students>()
    
//    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        db.createTable()
        

//        let url = try!
//            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil ,create: false).appendingPathComponent("StudentDB.sqlite")
//
//        if sqlite3_open(url.path, &db) != SQLITE_OK{
//            print("Error opening")
//        }
//
//        let createTable = "CREATE TABLE IF NOT EXISTS StudentDB (id INTEGER PRIMARY KEY AUTOINCREMENT, firstname TEXT, lastname TEXT, email TEXT, password TEXT)"
//
//        if sqlite3_exec(db, createTable, nil, nil, nil) != SQLITE_OK{
//            print("Creating table problem")
//            return
//        }
        
    }
    
    // Do any additional setup after loading the view.
    
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        let firstName = firstNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if((firstName?.isEmpty)! || (lastName?.isEmpty)! || (email?.isEmpty)! || (password?.isEmpty)!){
            showAlert(alertTitle: "Missing Fields", message: "All fields are required!")
            return
        } else {
//            
//            db.insert(firstname: firstName!, lastname: lastName!, email: email!, password: password!)
//            students = db.checkUser()
            
             
//            db.insertData(firstName: firstName!, lastName: lastName!, email: email!, password: password!)
//            showAlert(alertTitle: "Sign up", message: "Successfully registered")
//
//
//            var stmt: OpaquePointer?
//            
//            let insertTable = "INSERT INTO StudentDB (firstname, lastname, email, password) VALUES(?,?,?,?)"
//            
//            if sqlite3_prepare(db, insertTable, -1, &stmt, nil) != SQLITE_OK{
//                print("Insert error")
//            }
//            
//            if sqlite3_bind_text(stmt, 1, firstName, -1, nil) != SQLITE_OK{
//                print("error binding firstname")
//            }
//            
//            if sqlite3_bind_text(stmt, 2, lastName, -1, nil) != SQLITE_OK{
//                print("error binding lastname")
//            }
//            
//            if sqlite3_bind_text(stmt, 3, email, -1, nil) != SQLITE_OK{
//                print("error binding email")
//            }
//            
//            if sqlite3_bind_text(stmt, 4, password, -1, nil) != SQLITE_OK{
//                print("error binding password")
//            }
//            
//            if sqlite3_step(stmt) == SQLITE_DONE {
//                print("Database saved successfully")
//                
//                showAlert(alertTitle: "Sign up", message: "Successfully Registered!")
//            }
            
        }}
        
        
        //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //        let context = appDelegate.persistentContainer.viewContext
        //
        //        let firstName = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        //        let lastName = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        //        let email = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        //        let password = NSEntityDescription.insertNewObject(forEntityName: "StudentDatabase", into: context)
        //
        //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentDatabase")
        //        fetchRequest.returnsObjectsAsFaults = false
        //
        //        do{
        //            let results = try context.fetch(fetchRequest)
        //
        //            for result in results as! [NSManagedObject]{
        //                if let email = result.value(forKey:"email") as? String{
        //                    self.emailArray.append(email)}
        //            }
        //        }catch {
        //            print("Error")
        //        }
        //
        //
        //
        //        if((firstNameTF.text == "") || (lastNameTF.text == "") || (emailTF.text == "") || ( passwordTF.text == "")){
        //            showAlert(alertTitle: "Missing Fields", message: "All fields are required!")
        //        } else {
        //
        //            if(emailArray.contains(emailTF.text!)){
        //                showAlert(alertTitle:"Account Exists", message:"This account already exists!")
        //            } else{
        //
        //                firstName.setValue(self.firstNameTF.text, forKey: "firstName")
        //                lastName.setValue(self.lastNameTF.text, forKey: "lastName")
        //                email.setValue(self.emailTF.text, forKey: "email")
        //                password.setValue(self.passwordTF.text, forKey: "password")
        //                showAlert(alertTitle: "Sign up", message: "Successfully Registered!")
        //
        //
        //            }
        //
        //
        //        } }
        
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
