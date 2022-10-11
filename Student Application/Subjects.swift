import UIKit

class Subjects {
    
    var id: Int = 0;
    var semester: String = ""
    var subject: String = ""
    var professor: String = ""
    var ects: Int = 0
    
    init(id:Int, semester: String, subject:String, professor:String, ects:Int) {
        self.id = id
        self.semester = semester
        self.subject = subject
        self.professor = professor
        self.ects = ects
    }
}
