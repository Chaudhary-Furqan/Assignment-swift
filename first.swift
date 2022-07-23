import Foundation


let file = "file.txt" // file we will write and read, Documents/file.txt
var text = "some text" //just a text

if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first 
{
    let fileURL = dir.appendingPathComponent(file)
    var text  = ""

    for _ in 1...20 
    {
    let num1 = String(Int.random(in: 2...10))
    let num2 = String(Int.random(in: 2...10))

    text += num1 + "," + num2 + " , "
	
    }

    print("The generated numbers are : " ,text)

    do 
    {
        try text.write(to: fileURL, atomically: true, encoding: .utf8) // writing
    }

    catch 
    { 
        print("Error")
    }
}


