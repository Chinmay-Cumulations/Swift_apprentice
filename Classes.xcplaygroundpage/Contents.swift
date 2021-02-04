import UIKit

class Person
{
    
    var firstName : String
    var lastName : String
    
    init(firstName:String,lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class List
{
    var name : String
    var movieTitles : [String]
    init(name:String,movieTitles:[String]) {
        self.name = name
        self.movieTitles = movieTitles
    }
    
    func printMovieList() {
        movieTitles.forEach { (title:String) in
            print(title)
        }
    }
}

class User
{
    var movieList : [String:List] = [:]
    
    func addList(userList:List)  {
        movieList[userList.name] = userList
    }
    
    func getList(name:String) -> List? {
        movieList[name]
    }
    
    
}


struct Grade
{
    let topic : String
    let creditsEarned : Int
    let totalCredits : Int
}

class Student
{
    var grades : [Grade] = [Grade]()
    var studentName : String
    var studentDetails : String {
        grades.reduce("studentName:\(studentName)\n") { (prevValue:String, grade:Grade) -> String in
            prevValue+"topic:\(grade.topic) creditsEarned:\(grade.creditsEarned) totalCredits:\(grade.totalCredits) \n"
        }
    }
    
    var gpa : Float
    {
        let totalCreditsEarned = grades.reduce(0) { (result:Int, grade:Grade) -> Int in
            result+grade.creditsEarned
        }
        
        let totalCredits = grades.reduce(0) { (result:Int, grade:Grade) -> Int in
            result+grade.totalCredits
        }
        
        return Float(totalCredits)/Float(totalCreditsEarned)
    }
    
    init(studentName:String) {
        self.studentName = studentName
    }
    
    func addGrade(grade:Grade) {
        grades.append(grade)
    }
}

struct TShirt
{
    let size : Int
    let color : String
    let price : Float
    var image : String = "noImage"
}

struct Address {
    var name : String
    var street : String
    var city : String
    var zipCode : Int
}

class ShoppingCart
{
    var selectedShirts : [TShirt] = []
    var deliveryAddress : Address
    
    var totalPrice : Float {
        selectedShirts.reduce(0.0) { (result:Float, tshirt:TShirt) -> Float in
            result + tshirt.price
        }
    }
    
    func addTShirt(tshirt:TShirt)
    {
        selectedShirts.append(tshirt)
    }
    
    init(deliveryAddress:Address) {
        self.deliveryAddress = deliveryAddress
    }
    
    
}

class UserT
{
    var name : String
    var email : String
    var shoppingCart : ShoppingCart
    
    init(name:String,email:String,address: Address) {
        self.name  = name
        self.email = email
        shoppingCart = ShoppingCart(deliveryAddress: address)
    }
    
}



func memberOf(person:Person,group:[Person]) -> Bool
{
    group.contains(where: {
        (personele) -> Bool in return personele === person
    })
}


var persons1 : [Person] = (0..<5).map({
    (value:Int) -> Person
     in return Person(firstName: "personF"+String(value), lastName: "personL" + String(value))
})

var persons2 : [Person] = (0..<5).map({
    (value:Int) -> Person
     in return Person(firstName: "Fperson"+String(value), lastName: "Lperson" + String(value))
})

var checkPerson = Person(firstName: "fpp", lastName: "lpp")

let student1 = Student(studentName: "Sname")

let jane = User()
let john = User()

let janeMoviePreference = List(name: "Jane", movieTitles: ["movie2","movie1","movie0"])
let johnMoviePreference = List(name: "John", movieTitles: ["movie2","movie3","movie4"])


student1.addGrade(grade: Grade(topic: "history", creditsEarned: 3, totalCredits: 9))
student1.addGrade(grade: Grade(topic: "C", creditsEarned: 4, totalCredits: 16))

persons2.append(checkPerson)

print(memberOf(person: checkPerson, group: persons1))

print(student1.studentDetails)

print(student1.gpa)



jane.addList(userList: janeMoviePreference)
jane.addList(userList: johnMoviePreference)

john.addList(userList: johnMoviePreference)
john.addList(userList: janeMoviePreference)



if let movieList = jane.getList(name: "John")
{
    movieList.printMovieList()
    movieList.movieTitles.append(contentsOf: jane.getList(name: "Jane")!.movieTitles)
}

if let movieList = john.getList(name: "John")
{
    movieList.printMovieList()
}



var inventory = [TShirt(size: 30, color: "black", price: 100.0),TShirt(size: 40, color: "black", price: 150.0),TShirt(size: 50, color: "black", price: 200.0,image: "image1")]

var userT = UserT(name: "user1", email: "user1@email.com", address: Address(name: "user1", street: "streetname", city: "cityName", zipCode: 12345))

userT.shoppingCart.addTShirt(tshirt: inventory[2])
userT.shoppingCart.addTShirt(tshirt: inventory[1])

print(userT.shoppingCart.totalPrice)
