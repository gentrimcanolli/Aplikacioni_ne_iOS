//
//  TableViewContollerViewController.swift
//  Student Application
//
//  Created by Gentrim Canolli on 9/10/22.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var subjectsTableView: UITableView!
    
    var db = DbHelper()
    
    var subs = Array<Subjects>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectsTableView.delegate = self
        subjectsTableView.dataSource = self
    
        db.insertSubjects(subject: "Internet", professor: "Lule Ahmeti", ects: 50)
        db.insertSubjects(subject: "Internet1", professor: "Lule Ahmeti1", ects: 50)
        db.insertSubjects(subject: "Internet2", professor: "Lule Ahmeti2", ects: 50)
        db.insertSubjects(subject: "Internet3", professor: "Lule Ahmeti3", ects: 50)
        
        subs = db.checkSubjects()
    
        
    }
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

extension TableViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = subjectsTableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
                cell.textLabel?.numberOfLines = 0
        
                cell.textLabel?.text = subs[indexPath.row].id.description
                    + " -> Subject: " + subs[indexPath.row].subject
                    + " | Professor: " + subs[indexPath.row].professor
                    + " | ECTS: " + subs[indexPath.row].ects.description
        
                return cell
        
    }
    
}
