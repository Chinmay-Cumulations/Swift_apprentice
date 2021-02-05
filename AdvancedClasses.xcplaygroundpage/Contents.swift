import Foundation

class Person
{
    var firstName : String
    var lastName : String
    var fullName : String{
        firstName+" "+lastName
    }
    
    required init(firstName:String,lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student : Person
{

    static var graduates : [String] = []
    
    required init(firstName:String,lastName:String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    deinit {
        Student.graduates.append(fullName)
    }
}


class A
{
    required init() {
        print("I'm A")
    }
    
    deinit {
        print("I'm A-d")
    }
}

class B : A
{
    required init() {
        print("I'm B")
        super.init()
        print("I'm B")
    }
    
    deinit {
        print("I'm B-d")
    }
}

class C : B
{
    required init() {
        print("I'm C")
        super.init()
        print("I'm C")
    }
    
    deinit {
        print("I'm C-d")
    }
}

class Sport
{
    var name : String
    
    init(sportName:String) {
        self.name = sportName
    }
}

class BaseBall : Sport
{
    var number : Int
    var position : Int
    var averageMark : Int
    
    init(number:Int,position:Int,averageMark:Int) {
        self.number = number
        self.position = position
        self.averageMark = averageMark
        super.init(sportName: "baseball")
    }
    
    func getInfo() {
        print("\(number) \(position) \(averageMark)")
    }
}


class Athelete : Student
{
    var sports : [Sport]
    
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    
    init(firstName:String,lastName:String,sports:[Sport]) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }
}


var students : [Student?] = [Student(firstName: "student", lastName: "A"),Student(firstName: "student", lastName: "B")]

students[0] = nil

print(Student.graduates)


var athleteStudent = Athelete(firstName: "player", lastName: "A", sports: [BaseBall(number: 20, position: 10, averageMark: 50),Sport(sportName: "Circket")])



(athleteStudent.sports[0] as! BaseBall).getInfo()
if let sport = (athleteStudent.sports[1] as? BaseBall )
{
    sport.getInfo()
}
else
{
    print("failed downcasting to subclass")
}


//var c = C()

do{
    var c = C()
    var a : A = c as A
}


