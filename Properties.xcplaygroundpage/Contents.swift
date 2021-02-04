import UIKit

struct Bulb
{
    static var maxCurrentRating = 30
    lazy var state = {
        self.current>Self.maxCurrentRating
        }()
    var current = 10{
        willSet
        {
            if(newValue>Self.maxCurrentRating)
            {
                state = false
                print("turning switch off")
            }
            else{
                state=true
            }
        }
        didSet
        {
            if(self.current>Self.maxCurrentRating)
            {
                print("Over current detected")
                self.current = oldValue
                self.state = true
            }
        }
    }
}

struct Circle
{
    var radius : Float
    
    var circumference : Float
    {
        radius*Float.pi*2.0
    }
}

struct Icecream
{
    var name : String = "icecream1"
    lazy var ingredients = ["milk","sugar"]
    
    mutating func prepareIceCream() {
        print(ingredients)
    }
    
    init(name:String) {
        self.name = name
    }
}

struct Car
{
    var fueltank : FuelTank
}

struct FuelTank
{
    var lowFuel : Bool = false
    var internalLevel = Float(0.0) {
        didSet{
            if(self.internalLevel<0.1)
            {
                lowFuel = true
            }
            else
            {
                lowFuel = false
            }
        }
    }
    
    var level : Float{
        set{
            if(newValue>1.0)
            {
                internalLevel = 1.0
            }
            else if(newValue<0.0)
            {
                internalLevel = 0.0
            }
            else
            {
                internalLevel = newValue
            }
        }
        
        get{
            internalLevel
        }
    }
    
}


struct SimpleDate
{
    let months = ["January", "February", "March",
                  "April", "May", "June",
                  "July", "August", "September",
                  "October", "November", "December"]
    let daysInMonth = [31,29,31,30,31,30,31,31,30,31,30,31]
    
    var month : String
    var day : Int
    
    
    
    var monthsTillWinter  : Int
    {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
    
    mutating func advance()  {
        
        if let monthIndex = months.firstIndex(of: month)
        {
            day+=1
            if(day > daysInMonth[monthIndex])
            {
                day -= daysInMonth[monthIndex]
                if(monthIndex+1 >= months.count)
                {
                    month = months[0]
                }
                else{
                    month = months[monthIndex+1]
                }
            }
        }
        else
        {
            print("Invalid month name")
        }

    }
    
    
}
var la = 20


extension Int
{
    var isEven : Bool {
        self%2==0
        
    }
    
    var isOdd : Bool {
        self%2 != 0
    }
    
    func primeFactors() -> [Int] {
        
        var remainingValue = self
        
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
          if remainingValue % testFactor == 0 {
            primes.append(testFactor)
            remainingValue /= testFactor
          }
          else {
            testFactor += 1
          }
        }
        if remainingValue > 1 {
          primes.append(remainingValue)
        }
        return primes
      }
    
    
}

extension Circle
{
    var area : Float {
        set{
            self.radius = (newValue/Float.pi).squareRoot()
        }
        get{
            Float.pi*self.radius*self.radius
        }
    }
    
    mutating func growAreaBy(scale:Float) {
        self.radius = (area*scale/Float.pi).squareRoot()
    }
}


var bulb1  = Bulb()
var circle = Circle(radius: 1)
var iceCream = Icecream(name: "choclate")
var car = Car(fueltank: FuelTank())



print(circle.area)

circle.area = 6.0

circle.growAreaBy(scale: 2.0)

print(circle.area)

bulb1.current = 300

print("\(bulb1.current) and \(bulb1.state)")


bulb1.current = 30

print("\(bulb1.current) and \(bulb1.state)")

iceCream.prepareIceCream()

car.fueltank.level = 0.5

print("fuel level is \(car.fueltank.level) and is low fuel \(car.fueltank.lowFuel)")

var date  = SimpleDate(month: "December", day: 31)

print("the date is \(date.day) and month is \(date.month)")

date.advance()

print("the date is \(date.day) and month is \(date.month)")


var numb = Int(81)

print("is \(numb) odd \(numb.isOdd) and even \(numb.isEven) and prime factors \(numb.primeFactors())")

