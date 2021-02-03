import UIKit

let names = ["name0","name11","name222","name3333"]
let namesNAges = ["name0":12,"name11":34,"name222":20,"name3333":10]

let filteredNames = names.filter(){$0.count>5}

let filteredNamesNAges = namesNAges.filter { (key:String,value:Int) -> Bool in
    return  value>18
}

var newfilteredNames = filteredNamesNAges.map({(key:String,value:Int) -> String in return key })

var concatFNames = filteredNamesNAges.reduce("") { (initialValue:String, ele:(key:String,value:Int)) -> String in
    return initialValue+ele.key
}

print(concatFNames)
print(filteredNamesNAges)

print(newfilteredNames)

print(filteredNames.reduce("",{(name0:String,name1:String) -> String in return name0+name1 }))



func runTask(task:() -> Void,times:Int)
{
    for _ in 0..<times
    {
        task()
    }
}

func mathSum(length:Int,series:(Int) -> Int) -> Int
{
    var sum = 0
    for i in 1...length
    {
        sum+=series(i)
    }
    return sum
}


func characterCount(_ input:String)
{
    var charcterDict : [Character:String] = [:]
    
    input.forEach({(char:Character) -> Void in charcterDict[char,default:""]+="#"})
    
    print(charcterDict)
}

func characterCountGeneric(_ input:String)
{
    var characterDict : [Character:Int] = [:]
    
    var dumInput = input
    
    for i in input
    {
        while let index = dumInput.firstIndex(of: i)
        {
            characterDict[i,default:0] += 1
            dumInput.remove(at: index)
        }
    }
    
    print(characterDict)
}

func filterByAverageRatings(dict:[String:[Int]]) -> [String]
{
    var averageRatings : [String:Float] = [:]
    
    dict.forEach { (body:(key:String,value:[Int])) -> Void in
        averageRatings[body.key] = Float(body.value.reduce(0, {$0+$1}))/Float(body.value.count)
    }
    
    averageRatings = averageRatings.filter { (body:(key:String,value:Float)) -> Bool in
        body.value>Float(3.0)
    }
    
    let topList = averageRatings.map { (body:(key:String,value:Float)) -> String in
        body.key
    }
    
    return topList
}

func nameFormatter(inputName:String) -> String
{
    var correctedName = ""
    if let delimIndex = inputName.firstIndex(of: ",")
    {
        correctedName = String(inputName[inputName.index(after: delimIndex)...]) + String(inputName[..<delimIndex])
    }
    return correctedName
}


func component(input:String,delimiter:Character) -> [String]
{
    var splitted : [String] = []
    var s_index : String.Index = input.startIndex
    
    for i in input.indices
    {
        if input[i] == delimiter
        {
            splitted.append(String(input[s_index..<i]))
            s_index = input.index(after: i)
        }
    }
    
    splitted.append(String(input[s_index...]))
    
    return splitted
}

func wordReverser(input:String,delimiter:Character) -> String
{
    var reversedWordString = ""
    var s_index : String.Index = input.startIndex
    
    for i in input.indices
    {
        if input[i] == delimiter
        {
            reversedWordString += (String(input[s_index..<i]).reversed() + " ")
            s_index = input.index(after: i)
        }
    }
    

    reversedWordString += (String(input[s_index...]).reversed() )
    return reversedWordString
}




runTask(task: {() -> Void in print("task is running")}, times: 10)

print("sum of first 10 elements of fibonnaci seq " + String(mathSum(length: 10) { (value:Int) -> Int in
    var (n1,n2,n3) = (0,1,0)
    if(value == 0 || value == 1)
    {
        return value
    }
    for _ in 2...value
    {
        n3=n1+n2
        n1=n2
        n2=n3
    }
    return n3
}))

let appRatings = [
  "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
  "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
  "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var wordCount = { (input:String) -> Int in
    var onlyWS = input.filter({$0==" "})
    return onlyWS.count+1
}

print("Sum of first 10 elements of square elements  "+String(mathSum(length: 10, series: {$0*$0})) )

print(filterByAverageRatings(dict: appRatings))

characterCount("hello world")
characterCountGeneric("hello world")

print("word count is \(wordCount("hello World "))")

print(nameFormatter(inputName: "gallog,matt"))
print(component(input: "hello,world,here", delimiter: ","))

print(wordReverser(input: "my dog is good", delimiter: " "))
