import UIKit

protocol Area
{
    var area : Float {get}
}

struct Square : Area
{
    var sideLength : Float
    var area: Float {
        sideLength * sideLength
    }
    
        
}

struct Circle : Area
{
    var area: Float {
        Float.pi * radius * radius
    }
    var radius : Float
    
}

struct Rectangle : Area
{
    var length : Float
    var breadth : Float
    
    var area: Float{
        length * breadth
    }
}


protocol petAble
{
    func  feed()
    var name : String
    {
        get
        set
    }
    var isFed : Bool{
        get
        set
    }
}

protocol cageAble : petAble
{
    var isCaged : Bool {
        get
        set
    }
    
    var isCageDirty : Bool
    {
        get
        set
    }
    func cleanCage()
}

protocol swimAble : petAble
{
    var isPutInTank : Bool{
        get
        set
    }
    
    var isTankDirty : Bool
    {
        get
        set
    }
    
    func cleanTank()
    
}


protocol walkAble : petAble
{
    func exercise()
}


struct Fishes : swimAble{
    var name: String
    
    
    var isTankDirty: Bool = false{
        didSet{
            if(self.isTankDirty)
            {
                cleanTank()
                self.isTankDirty=false
            }
            else
            {
                print("tank already clean \(name)")
            }
        }
    }
    
    var isFed: Bool = false{
        didSet
        {
            if(self.isFed)
            {
                print("Already fed \(name)")
            }
            else
            {
                feed()
                self.isFed = true
            }
        }
    }
    
    var isPutInTank: Bool = false{
        didSet
        {
            if(self.isPutInTank)
            {
                print("\(name) is already in tank")
            }
            else
            {
                cleanTank()
                print("Will put \(name) to the tank")
                self.isPutInTank=true
            }
        }
    }
    
    func cleanTank() {
        print("Cleaned the tank for \(name)")
    }
    
    func feed() {
        print("Fed the fish \(name) ")
    }
    
    
}

struct Birds : cageAble
{
    var name: String
    
    var isCageDirty: Bool = false{
        didSet{
            if(self.isCageDirty)
            {
                cleanCage()
                self.isCageDirty=false
            }
            else
            {
                print("Cage already clean for \(name)")
            }
        }
    }
    
    var isFed: Bool = false{
        didSet
        {
            if(self.isFed)
            {
                print("Already fed \(name)")
            }
            else
            {
                feed()
                self.isFed = true
            }
        }
    }
    
    var isCaged: Bool = false{
           didSet
           {
               if(self.isCaged)
               {
                   print(" \(name) is already in cage")
               }
               else
               {
                   cleanCage()
                   print("Will put \(name) to the cage")
                   self.isCaged=true
               }
           }
       }
    
    func cleanCage() {
        print("Cleaned the cage for \(name)")
    }
    
    func feed() {
        print("fed the bird \(name)")
    }
    
}

struct walkablePets : walkAble
{
    var name: String
    
    var isFed: Bool = false {
        didSet
        {
            if(self.isFed)
            {
                print("Already fed \(name)")
            }
            else
            {
                feed()
                self.isFed = true
            }
        }
    }
    
    func exercise() {
        print("took \(name) for an exercise")
    }
    
    func feed() {
        print("Fed the walkable pet \(name)")
    }
    
    
}


var shapes = [Rectangle(length: 1.0, breadth: 2.0) as Area,Square(sideLength: 1.0) as Area ,Circle(radius: 1.0) as Area]

print(shapes.map { (area:Area) -> Float in
    area.area
})


var walkable  = [walkablePets(name: "Dog"),walkablePets(name: "cat")]
var birds = [Birds(name: "parrot"),Birds(name: "Sparrow")]
var fishes = [Fishes(name: "goldFish"),Fishes(name: "snapper")]


fishes[0].isFed = false
fishes[1].isTankDirty = true
fishes[0].isPutInTank = true

walkable[0].exercise()

walkable[1].isFed = false

birds[0].isCageDirty = true
birds[1].isCaged = false

