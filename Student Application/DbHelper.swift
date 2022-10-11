import UIKit
import SQLite3
import Foundation

class DbHelper {
    
    init() {
        db = openDatabase()
    }
    
    let path: String = "StudentDB.sqlite"
    var db: OpaquePointer?
    
    
    func openDatabase() -> OpaquePointer? {
        let url = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil ,create: false).appendingPathComponent(path)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(url.path, &db) != SQLITE_OK {
            debugPrint("Can't open database")
            return nil
        }
        
        else{
            print("Successfully created connection with database")
            return db
        }
    }
    
    
    func createTableStudent(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS student(id INTEGER PRIMARY KEY AUTOINCREMENT,firstname TEXT, lastname TEXT, email TEXT, password TEXT);"
        
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableQuery, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Student table created")
            } else{
                print("Table could not be created")
            }
        } else{
            print("Create table error")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insertStudent(firstname: String, lastname:String, email:String, password:String) {
        let students = readUser()
        
        for s in students{
            if s.email == email {
                return
            }
        }
        
        let insertQuery = "INSERT INTO student(firstname,lastname,email,password) VALUES (?,?,?,?);"
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            sqlite3_bind_text(insertStatement, 1, (firstname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (lastname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row")
            } else{
                print("Error inserting rows")
            }
            
        } else{
            print("Insert statement could not be prepared")
        }
        
        sqlite3_finalize(insertStatement)
    }
    
    func readUser() -> [Students]{
        let checkQuery = "SELECT * FROM student;"
        var checkStatement: OpaquePointer? = nil
        
        var students: [Students] = []
        
        if sqlite3_prepare_v2(db, checkQuery, -1, &checkStatement, nil) == SQLITE_OK{	
            while sqlite3_step(checkStatement) == SQLITE_ROW{
                let id = sqlite3_column_int(checkStatement, 0)
                let firstname = String(describing: String(cString: sqlite3_column_text(checkStatement, 1)))
                let lastname = String(describing: String(cString: sqlite3_column_text(checkStatement, 2)))
                let email = String(describing: String(cString: sqlite3_column_text(checkStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(checkStatement, 4)))
                
                students.append(Students(id: Int(id), firstname: firstname, lastname: lastname, email: email, password: password))
                
                print("Query results: ")
                print("\(firstname) | \(lastname) | \(email) | \(password)")
            }
        } else{
            print("Select query error")
        }
        sqlite3_finalize(checkStatement)
        return students
    }
    
    
    func createTableSubjects(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS subjects(id INTEGER PRIMARY KEY AUTOINCREMENT, semester TEXT, subject TEXT, professor TEXT, ects INTEGER);"
        
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableQuery, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Subjects table created")
            } else{
                print("Table could not be created")
            }
        } else{
            print("Create table error")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insertSubjects(semester: String, subject: String, professor:String, ects:Int) {
        let readSubject = readSubjects()
        
        for s in readSubject{
            if s.subject == subject {
                return
            }
        }
        
        let insertQuery = "INSERT INTO subjects(semester,subject,professor,ects) VALUES (?,?,?,?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            
            sqlite3_bind_text(insertStatement, 1, (semester as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (subject as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (professor as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, Int32(ects))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row")
            } else{
                print("Error inserting rows")
            }
        } else{
            print("Insert statement could not be prepared")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func readSubjects() -> [Subjects]{
        let checkQuery = "SELECT * FROM subjects;"
        var checkStatement: OpaquePointer? = nil
        
        var subjects: [Subjects] = []
        
        if sqlite3_prepare_v2(db, checkQuery, -1, &checkStatement, nil) == SQLITE_OK{
            while sqlite3_step(checkStatement) == SQLITE_ROW{
                let id = sqlite3_column_int(checkStatement, 0)
                
                let semester = String(describing: String(cString: sqlite3_column_text(checkStatement, 1)))
                
                let subject = String(describing: String(cString: sqlite3_column_text(checkStatement, 2)))
                
                let professor = String(describing: String(cString: sqlite3_column_text(checkStatement, 3)))
                
                let ects = sqlite3_column_int(checkStatement, 4)
                
                subjects.append(Subjects(id: Int(id), semester: semester, subject: subject, professor: professor, ects: Int(ects)))
                print("Query results: ")
                print("\(id) | \(subject) | \(professor) | \(ects)")
            }
        } else{
            print("Select query error")
        }
        sqlite3_finalize(checkStatement)
        return subjects
    }
}
