import UIKit

enum Months : Int
{
    case jan=1,feb,mar,april,may,june,july,aug,sept,oct,nov,dec
    
    var semester : String?
    {
        switch (self)
        {
        case .aug,.sept,.oct,.nov,.dec:
            return "autumn"
        case  .jan,.feb,.mar,.april:
            return "spring"
        case .may,.june,.july:
            print("no semester")
            return nil
        }
    }
    
    var monthsTillSummer : Int{
        var months = (Months.june.rawValue - self.rawValue)
        
        
        guard months < 0 else { return months }
        return (months  + 12 )
    }
    
    var monthsTillWinterBreak : Int
    {
        Months.dec.rawValue - self.rawValue
    }
}

enum Directions
{
    case north,south,east,west
    
    static func currentPosition(directions:[Directions]) -> (x:Int,y:Int) {
        directions.reduce((0,0)) { (result:(Int,Int), direction:Directions) -> (Int,Int) in
            switch direction {
            case Directions.north:
                return (result.0 + 1 , result.1)
            case Directions.south:
                return (result.0 - 1, result.1)
            case Directions.east:
                return (result.0,result.1 + 1)
            case Directions.west:
                return (result.0,result.1 - 1)
            }
        }
    }
    
}

enum Coins : Int
{
    case penny = 1,nickel=5,dime=10,quarter=25
    
    static func totalCents(coins:[Coins]) -> Int {
        coins.reduce(0) { (result:Int, coin:Coins) -> Int in
            result+coin.rawValue
        }
    }
}

enum Math :Float
{
    case e = 2.718
}



var month = Months.july
var purse : [Coins] = [Coins.dime,Coins.quarter,Coins.dime]

print("months till summer \(month.monthsTillSummer)")
print("total cents is \(Coins.totalCents(coins: purse))")


print(month.monthsTillWinterBreak)

purse.forEach { (coin:Coins) in
    print(coin.rawValue)
}

print(Math.e.rawValue)

if let sem = month.semester
{
    print(sem)
}
else
{
    print("no sem in school")
}


let movements: [Directions] = [.north, .north, .west, .south,
  .west, .south, .south, .east, .east, .south, .east]

print(Directions.currentPosition(directions: movements))

