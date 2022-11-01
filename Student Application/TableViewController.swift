import UIKit

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var subjectsTableView: UITableView!
    
    var db = DbHelper()
    var subs = Array<Subjects>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.createTableSubjects()
        self.title = "Subjects"
        
        subjectsTableView.delegate = self
        subjectsTableView.dataSource = self
        
        db.insertSubjects(semester: "1", subject: "Mathematics 1", professor: "Qefsere Gjonbalaj", ects: 7)
        db.insertSubjects(semester: "1", subject: "Physics 1", professor: "Skender Ahmetaj", ects: 6)
        db.insertSubjects(semester: "1", subject: "Fundamentals of electrical engineering", professor: "Luan Ahma", ects: 7)
        db.insertSubjects(semester: "1", subject: "Programming Language", professor: "Kadri Sylejmani", ects: 5)
        db.insertSubjects(semester: "1", subject: "English Language", professor: "From Univeristy staff", ects: 5)
        
        db.insertSubjects(semester: "2", subject: "Electric Circuits", professor: "Luan Ahma", ects: 7)
        db.insertSubjects(semester: "2", subject: "Physics 2", professor: "Skender Ahmetaj", ects: 6)
        db.insertSubjects(semester: "2", subject: "Mathematics 2", professor: "Qefsere Gjonbalaj", ects: 7)
        db.insertSubjects(semester: "2", subject: "Algorithms and Data Structures", professor: "Kadri Sylejmani", ects: 5)
        db.insertSubjects(semester: "2", subject: "Digital Circuit", professor: "Sabrije Osmanaj", ects: 5)
        
        db.insertSubjects(semester: "3", subject: "Electronics", professor: "Qamil Kabashi", ects: 5)
        db.insertSubjects(semester: "3", subject: "Mathematics 3C", professor: "Qefsere Gjonbalaj", ects: 5)
        db.insertSubjects(semester: "3", subject: "Signals and Systems", professor: "Vjosa Shatri", ects: 5)
        db.insertSubjects(semester: "3", subject: "Databases", professor: "Lule Ahmedi", ects: 5)
        db.insertSubjects(semester: "3", subject: "Object Oriented Programming", professor: "Isak Shabani", ects: 5)
        
        db.insertSubjects(semester: "4", subject: "Computer Architecture", professor: "Valon Raca", ects: 5)
        db.insertSubjects(semester: "4", subject: "Computer Networking", professor: "Blerim Rexha", ects: 5)
        db.insertSubjects(semester: "4", subject: "Data Security", professor: "Blerim Rexha", ects: 5)
        db.insertSubjects(semester: "4", subject: "Human Computer Interaction", professor: "Isak Shabani", ects: 5)
        db.insertSubjects(semester: "4", subject: "Internet Programming", professor: "Lule Ahmedi", ects: 5)
        db.insertSubjects(semester: "4", subject: "Project Management", professor: "Sevdije Alshiqi", ects: 5)
        
        db.insertSubjects(semester: "5", subject: "Microprocessors and Microcontrollers", professor: "Lavdim Kurtaj", ects: 6)
        db.insertSubjects(semester: "5", subject: "Operating Systems", professor: "Isak Shabani", ects: 6)
        db.insertSubjects(semester: "5", subject: "Software Engineering", professor: "Blerim Rexha", ects: 6)
        db.insertSubjects(semester: "5", subject: "Internet Security", professor: "Blerim Rexha", ects: 6)
        db.insertSubjects(semester: "5", subject: "Entreprenuership", professor: "Sevdije Alshiqi", ects: 6)
        
        db.insertSubjects(semester: "6", subject: "Distributed Systems", professor: "Isak Shabani", ects: 6)
        db.insertSubjects(semester: "6", subject: "Computer Networking Lab", professor: "Blerim Rexha", ects: 6)
        db.insertSubjects(semester: "6", subject: "Mobile Device Programming", professor: "Blerim Rexha", ects: 6)
        db.insertSubjects(semester: "6", subject: "Internship", professor: "no professor", ects: 6)
        db.insertSubjects(semester: "6", subject: "Bachelor Thesis", professor: "your diploma professor(choose)", ects: 6)
        
        subs = db.readSubjects()
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
        
        cell.textLabel?.text = subs[indexPath.row].id.description + "."
            + "\nSubject: " + subs[indexPath.row].subject
            + "\nProfessor: " + subs[indexPath.row].professor
            + "\nSemester: " + subs[indexPath.row].semester
            + "\nECTS: " + subs[indexPath.row].ects.description
        
        return cell
    }
}
