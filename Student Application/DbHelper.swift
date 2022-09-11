//
//  DbHelper.swift
//  Student Application
//
//  Created by Gentrim Canolli on 9/9/22.
//

import UIKit
import SQLite3
import Foundation

class DbHelper {
    
    init() {
        db = openDatabase()
        createTableSubjects()
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
        let students = checkUser()
        
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
    
    func checkUser() -> [Students]{
        let checkQuery = "SELECT * FROM student;"
        var checkStatement: OpaquePointer? = nil
        
        var students: [Students] = []

        if sqlite3_prepare_v2(db, checkQuery, -1, &checkStatement, nil) == SQLITE_OK{
            while sqlite3_step(checkStatement) == SQLITE_ROW{
                let id = sqlite3_column_int(checkStatement, 0)
                let firstname = String(describing: String(cString: sqlite3_column_text(checkStatement, 0)))
                let lastname = String(describing: String(cString: sqlite3_column_text(checkStatement, 1)))
                let email = String(describing: String(cString: sqlite3_column_text(checkStatement, 2)))
                let password = String(describing: String(cString: sqlite3_column_text(checkStatement, 3)))
              
                students.append(Students(id: Int(id), firstname: firstname, lastname: lastname, email: email, password: password))

                print("Query results: ")
                print("\(id) | \(firstname) | \(email)")
               
                
            }
        } else{
            print("Selecte query error")
        }
        
        sqlite3_finalize(checkStatement)
        return students
        
    }
    
    
    func createTableSubjects(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS subjects(id INTEGER PRIMARY KEY AUTOINCREMENT,subject TEXT, professor TEXT, ects INTEGER);"
        
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
    
    
    func insertSubjects(subject: String, professor:String, ects:Int) {
        let subjects = checkSubjects()
        
        for s in subjects{
            if s.subject == subject {
                return
            }
        }
        
        let insertQuery = "INSERT INTO subjects(subject,professor,ects) VALUES (?,?,?);"
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            sqlite3_bind_text(insertStatement, 1, (subject as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (professor as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(ects))
        
        
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
    
    func checkSubjects() -> [Subjects]{
        let checkQuery = "SELECT * FROM subjects;"
        var checkStatement: OpaquePointer? = nil
        
        var subjects: [Subjects] = []

        if sqlite3_prepare_v2(db, checkQuery, -1, &checkStatement, nil) == SQLITE_OK{
            while sqlite3_step(checkStatement) == SQLITE_ROW{
                let id = sqlite3_column_int(checkStatement, 0)
                let subject = String(describing: String(cString: sqlite3_column_text(checkStatement, 1)))
                let professor = String(describing: String(cString: sqlite3_column_text(checkStatement, 2)))
                let ects = sqlite3_column_int(checkStatement, 3)
              
                subjects.append(Subjects(id: Int(id), subject: subject, professor: professor, ects: Int(ects)))
                print("Query results: ")
                print("\(id) | \(subject) | \(professor) | \(ects)")
            }
            
           
           
        } else{
            print("Selecte query error")
        }
        
        sqlite3_finalize(checkStatement)
        return subjects
        
    }
    
    
    //    var db: OpaquePointer?
    //
    //    func createTable(){
    //
    //
    //        let url = try!
    //            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil ,create: false).appendingPathComponent("StudentDB.sqlite")
    //
    //        if sqlite3_open(url.path, &db) != SQLITE_OK{
    //            print("Error opening")
    //        }
    //
    //        let createTable = "CREATE TABLE IF NOT EXISTS StudentTable (id INTEGER PRIMARY KEY AUTOINCREMENT, firstname TEXT, lastname TEXT, email TEXT, password TEXT);"
    //
    //        if sqlite3_exec(db, createTable, nil, nil, nil) != SQLITE_OK{
    //            print("Creating table problem")
    //            return
    //        }
    //    }
    //
    //    func insertData(firstName: String, lastName: String, email: String, password: String){
    //        var queryStatement: OpaquePointer?
    //
    //        let insertQuery = "INSERT INTO StudentTable(firstname, lastname, email, password) VALUES(?,?,?,?);"
    //
    //        if sqlite3_prepare_v2(db, insertQuery, -1, &queryStatement, nil) != SQLITE_OK{
    //            print("Insert error")
    //        }
    //
    //        if sqlite3_bind_text(queryStatement, 1, firstName, -1, nil) != SQLITE_OK{
    //            print("error binding firstname")
    //        }
    //
    //        if sqlite3_bind_text(queryStatement, 2, lastName, -1, nil) != SQLITE_OK{
    //            print("error binding lastname")
    //        }
    //
    //        if sqlite3_bind_text(queryStatement, 3, email, -1, nil) != SQLITE_OK{
    //            print("error binding email")
    //        }
    //
    //        if sqlite3_bind_text(queryStatement, 4, password, -1, nil) != SQLITE_OK{
    //            print("error binding password")
    //        }
    //
    //        if sqlite3_step(queryStatement) == SQLITE_DONE {
    //            print("Database saved successfully")
    //        }
    //    }
    //
    //    func checkUser(email: String, password: String) -> Bool{
    //        var queryStatement: OpaquePointer?
    //        var check = false
    //
    //        let selectQuery = "SELECT * FROM StudentTable WHERE email = ? and password = ?;"
    //
    //        if sqlite3_prepare_v2(db, selectQuery, -1, &queryStatement, nil) == SQLITE_OK{
    //
    //            sqlite3_bind_text(queryStatement, 3, email, -1, nil)
    //            sqlite3_bind_text(queryStatement, 4, password, -1, nil)
    //
    //            check = true
    //
    //        } else{
    //            check = false
    //        }
    //
    //            return check
    //    }
    
}
