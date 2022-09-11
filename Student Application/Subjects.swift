//
//  Subjects.swift
//  Student Application
//
//  Created by Gentrim Canolli on 9/10/22.
//

import UIKit

class Subjects {
    
    var id: Int = 0;
    var subject: String = ""
    var professor: String = ""
    var ects: Int = 0
    
    init(id:Int, subject:String, professor:String, ects:Int) {
        self.id = id
        self.subject = subject
        self.professor = professor
        self.ects = ects
        
    }
    
}
