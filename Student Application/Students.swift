import Foundation

class Students {
    var id: Int = 0;
    var firstname: String = ""
    var lastname: String = ""
    var email: String = ""
    var password: String = ""
    
    init(id:Int, firstname:String, lastname:String, email:String, password:String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
    }
    
    var name: String{
        get {
            return firstname
        }
    }
    
    var surname: String {
        get{
            return lastname
        }
    }
}
