import Foundation


let file = "file.txt" //this is the file. we will write to and read from it
var numbers : [String]
let text = "some text" //just a text

var num1 = ""
var num2 = ""

func intoMatrix(row: Int, column: Int, flag: Bool, iteration: Int, box:Int) {
    if( iteration == 0){return}
    var plus = true
    for i in 1...row+column
    {
        if(plus)
        {
            if(!flag)
            {
                if(box < 2 && i < 3)
                {
                    print(".", terminator:"")             
                }
                else
                {
                    print("+", terminator: "")
                }
            }
            else
            {
                if(box < 2 && i < 3)
                {
                    print(".", terminator:"")           
                }
                else
                {
                    print("|", terminator: "")
                }
            }
            plus = false
        }
        else
        {
            if(!flag)
            {
                if(box < 2 && i < 3)
                {
                    print(".", terminator:"")
                }
                else
                {
                    print("-", terminator:"")   
                }
            }
            else
            {
                print(".", terminator:"")
            }
            plus = true
        }
    }
    
    if(plus)
    {
        if(!flag)
        {
            print("+", terminator:"")
        }
        else
        {
            print("|", terminator:"")
        }
    }
    else
    {
        if(!flag)
        {
            print("-+", terminator:"")
        }
        else
        {
            print(".|", terminator:"")
        }
    }
    print(terminator:"\n")
    if(!flag )
    {
        intoMatrix(row:row, column:column, flag:true,iteration: iteration-1, box:box+1)
    }
    else
    {
        intoMatrix(row:row, column:column, flag:false, iteration: iteration-1, box:box+1)
    }
}



if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

    let fileURL = dir.appendingPathComponent(file)
    //reading
    do 
    {
        let text2 = try String(contentsOf: fileURL, encoding: .utf8)
        print(text2)
        let fullNameArr = text2.components(separatedBy: [","," "])
        var numbers = [String]()
        for i in fullNameArr
        {
            if(i != "")
            {
                numbers.append(i)
            }
        }
        
        for j in numbers
        {
            if(num1 == "")
            {
                num1 = j
            }
            else if (num1 != "")
            {
                num2=j
	            let myInt1 = Int(num1) ?? 0
	            let myInt2 = Int(num2) ?? 0
                print("---MATRIX---")
	            print("num1 : ", myInt1)  
                print("num2 : ", myInt2)
                let row_column = myInt1 * 2 + 1                // total rows 
                intoMatrix(row:myInt1, column: myInt2, flag:false, iteration: row_column, box: 0)
                num1=""
                num2=""
            } 
        }   
    }
    catch
    {
        print("Error")
    }
}
