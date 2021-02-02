import UIKit


func removeOnce(_ item:Int,array:[Int]) -> [Int]?
{
    var dumArray = array
    if let indexOfFirst = array.firstIndex(of:item)
    {
        dumArray.remove(at:indexOfFirst)
        return dumArray
    }
    else
    {
        print("Couldn't find the item")
        return nil
    }
}

func removeAllOccurences(_ item:Int,array:[Int]) -> [Int]
{
    var dumArray = array
    while let indexOfFirst = dumArray.firstIndex(of: item)
    {
        dumArray.remove(at: indexOfFirst)
    }
    return dumArray
}

func middleElementOfArray(array:[Int]) -> Int
{
    if(array.count%2 == 0)
    {
        return (array[Int(floorf((Float(array.count)/2.0)))-1])
    }
    else
    {
        return (array[Int(ceilf((Float(array.count)/2.0)))-1])
        
    }
}

func reversedArray(array:[Int]) -> [Int]
{

    var dumArray = array
    var count = 0
    
    for i in stride(from: array.count-1, through: 0, by: -1)
    {
        dumArray[count] = array[i]
        count+=1
    }
    return dumArray
}

func minAndMax(array:[Int]) -> (Int,Int)
{
    var min = array[0]
    var max = array[0]
    for item in array
    {
        if(item>max)
        {
            max = item
        }
        if(item<min)
        {
            min = item
        }
    }
    return (min,max)
}

func printOnlyAboveEight(dict:[String:String])
{
    for (key,value) in dict
    {
        if(value.count>8)
        {
            print("key is \(key) and value is \(value)")
        }
    }
}

func mergeTwoDicts(dict1:[String:String],dict2:[String:String]) -> [String:String]
{
    var dumDict = dict1
    
    for (key,value) in dict2
    {
        dumDict[key]=value
    }
    return dumDict
}

func countCharacters(inp:String) -> [Character:Int]
{
    var characterDict : [Character:Int] = [:]
    for char in inp
    {
        characterDict[char,default:0] += 1
    }
    
    return characterDict
}

func isValuesUnique(dict:[String:Int]) -> Bool
{
    var valueSet : Set<Int> = []
    
    for (_,value) in dict
    {
        valueSet.insert(value)
    }
    
    return valueSet.count == dict.count ? true : false
}

var srcArray = [1,3,4,0,5,30,3,5,4,8,5]
var srcDict = ["CA":"california","NY":"New York"]
var srcDict2 = ["KA":"Kalifornia","NJ":"New Jork","NY":"New York"]



let removeOnceArray = removeOnce(4,array:srcArray) ?? [0]
let removeAllArray = removeAllOccurences(4, array: srcArray)
var minMax = minAndMax(array: srcArray)

print(srcArray)
print(removeOnceArray)
print(removeAllArray)
print(middleElementOfArray(array: srcArray))
print(reversedArray(array: srcArray))
print("the minimum is \(minMax.0) and maximum is \(minMax.1)")
printOnlyAboveEight(dict: srcDict)
print(mergeTwoDicts(dict1: srcDict, dict2: srcDict2))
print(countCharacters(inp: "California"))
print(isValuesUnique(dict: ["one":1,"two":2,"three":1]))


var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Ray": "Hacker"]

nameTitleLookup["Ray"] = nil
nameTitleLookup.updateValue(nil, forKey: "Mary")

print(nameTitleLookup)
