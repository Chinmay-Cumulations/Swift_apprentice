import UIKit

struct Location
{
    var x : Int
    var y : Int
}

struct DeliveryArea
{
    let center : Location
    let radius : Float
    
    func isLocationDeliverable(userLocation : Location) -> Bool {
        print("user is \(calculateDistance(src: center, dst: userLocation))")
        return calculateDistance(src: center, dst: userLocation) <= radius
    }
    
    func isOverLapping(restLocation: Location) -> Bool {
        return calculateDistance(src: center, dst: restLocation) <= radius
    }
}

func calculateDistance(src:Location,dst:Location) -> Float
{
    let x_cor = (src.x - dst.x)
    let y_cor = (src.y - dst.y)
    let result =  Float.squareRoot(Float((x_cor*x_cor) + (y_cor*y_cor)))()
    return result
}

var rest1 = DeliveryArea(center: Location(x: 0, y: 0), radius: 1.0)


print(rest1.isLocationDeliverable(userLocation: Location(x: 0, y: 1)))
print(rest1.isOverLapping(restLocation: Location(x: 0, y: 0)))


struct FruitContainer : CustomStringConvertible
{
    var description: String {
        "\(fruitName):\(baseWeight*Float(fruitsCount))"
    }
    
    let fruitName : String
    var fruitsCount : Int
    let baseWeight : Float
    
    
}

var fruitContainers = [FruitContainer(fruitName: "orange", fruitsCount: 0, baseWeight: 0.7),FruitContainer(fruitName: "pears", fruitsCount: 0, baseWeight: 0.3),FruitContainer(fruitName: "apple", fruitsCount: 0, baseWeight: 0.6)]

let fruitTruck = ["orange","pears","apple","orange","orange","apple"]

for i in fruitTruck
{
    switch i {
    case "orange":
        fruitContainers[0].fruitsCount+=1
    case "apple":
        fruitContainers[1].fruitsCount+=1
    case "pears":
        fruitContainers[2].fruitsCount+=1
    default :
        break
    }
}

print(fruitContainers)


struct TShirt
{
    var size : Character
    var color : String
    var material : String
    let baseFare = 100
    
    
    
    func getCost()  -> Int {
        var value = baseFare
        
        if(color=="black")
        {
            value+=50
        }
        if(material=="cotton")
        {
            value+=40
        }
        return value
    }
    
}


var tshirt = TShirt(size: "S", color: "white", material: "cotton")

print(tshirt.getCost())



struct Ship
{
    var origin : Location
    var direction : Bool
    var length : Int
}

struct player
{
    var ships : [Ship]
    var points : Int
    
    func isShotHit(selection:Location) -> Bool {
        for i in ships
        {
            if i.direction
            {
                if( (i.origin.y == selection.y) && (selection.x <= (i.origin.x + i.length)) &&  (selection.x >= (i.origin.x - i.length))  )
                {
                    return true
                }
            }
            else
            {
                if( (i.origin.x == selection.x) && (selection.y <= (i.origin.y + i.length)) &&  (selection.y >= (i.origin.y - i.length) )  )
                {
                    return true
                }

            }
        }
        
        return false
    }
}

var player1 = player(ships: [Ship(origin: Location(x: 5, y: 5), direction: true, length: 2),Ship(origin: Location(x: 3, y: 3), direction: false, length: 1)], points: 0)




print(player1.isShotHit(selection: Location(x: 2, y: 5)))
