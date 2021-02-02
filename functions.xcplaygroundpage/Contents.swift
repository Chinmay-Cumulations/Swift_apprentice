import UIKit

func printFullName(_ firstName:String,_ lastName:String) -> String
{
    return firstName + " " + lastName
}

func printFullName(firstName : inout String , lastname : String)
{
    firstName+=lastname
}

func printFullName(firstName: String , lastName: String) -> (name: String, count: Int)
{
    (firstName+lastName,(firstName+lastName).count)
}

func strideTillDecrementing()
{
    for i in stride(from: 10, through: 9, by: -0.1)
    {
        print("value is \(i)")
    }
}

func isNumDivisible(number:Int,divisor:Int) -> Bool
{
    return (number%divisor == 0)
}

func isPrime(_ number: Int) -> Bool
{
    for i in 2..<number
    {
        if(isNumDivisible(number: number, divisor: i))
        {
            return false
        }
    }
    return true
}

func recursiveFibonacci(number:Int) -> Int
{
    if(number==0 || number==1)
    {
        return number
    }
    return recursiveFibonacci(number: number-1) + recursiveFibonacci(number: number-2)
}

func divideIfWhole(value:Int,divisor:Int) -> Int?
{
    
    guard value%divisor==0 else {
        return nil
    }
    return value/divisor
}


func nestedGuard(_ input: Int???)
{
    
    guard let _ = input else {
        print("Not bound")
        return
    }
    
    print("\(input!!!)")
    
}

var fullName = "some"

printFullName("some","one")

printFullName(firstName: &fullName, lastname: "one")

var nameNCount : (String,Int) = printFullName(firstName: "some", lastName: "one" )

print("fullname is \(nameNCount.0) \(nameNCount.1)")
strideTillDecrementing()
print("the number is \(isPrime(6))")
let inputFib = 6
print("the fibnacci for \(inputFib) is \(recursiveFibonacci(number: inputFib))")


let returnedValue = divideIfWhole(value: 10, divisor: 2) ?? 0

if(returnedValue != 0)
{
    print("it divides by \(returnedValue)")
}
else
{
        print("no it doesnt")
}

let nestedOptionalz : Int??? = nil

nestedGuard(nestedOptionalz)
