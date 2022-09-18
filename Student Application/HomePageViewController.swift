//
//  HomePageViewController.swift
//  Student Application
//
//  Created by Gentrim Canolli on 9/8/22.
//

import UIKit

class HomePageViewController: UIViewController {
    
   
    @IBOutlet weak var welcomeLabel: UILabel!
    var db = DbHelper()
    
    var user = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.createTableStudent()
        user = db.readUser()
        
    }
    
    
    
    @IBAction func loanBtn(_ sender: Any) {
    }
    
    
    @IBAction func subjectsButton(_ sender: Any) {
        
    }
}
