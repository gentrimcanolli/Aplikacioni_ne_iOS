//
//  ViewController.swift
//  Student Application
//
//  Created by TDI Student on 30.8.22.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    func getUsers()
////    {   do{
////        let users = try context.fetch(StudentDatabase.fetchRequest(StudentDatabase.fetchRequest()))
////        }
////        catch{
////            //Error
////        }
////
////
//
//    }
//
//    func createUsers(){
////        let newUser = StudentDatabase(context:context)
////        newUser.firstName = firstName
////        newUser.lastName = lastName
////        newUser.email = email
////        newUser.password = password
////
////        do{
////            try context.save()
////
////        }
////        catch {
////            //Error
////        }
//
//    }
}

