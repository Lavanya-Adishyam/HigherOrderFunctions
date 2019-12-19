//
//  ViewController.swift
//  HigherOrderFunctions
//
//  Created by Lavanya on 18/12/19.
//  Copyright © 2019 Lavanya Akurathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numArray = [1, 2, 3, 4, 5, 6]
    let numArray1 = [2,3,4,9,3]
    var mapArray : [Int] = []
    var filterArray : [Int] = []
    var reduceArray : [Int] = []
    var flatMapArray : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        map()
        filter()
        reduce()
        flatMap()
        sorting()
        chaining()
    }
    func map(){
        
        print("-----------Map-----------")
        //Without using higher order functions - Map
        
        for num in numArray {
            mapArray.append( num * 4 )
        }
        print(mapArray) //[4, 8, 12, 16, 20, 24]
        
        //With using higher order functions - Map
        //Method 1
        
        let mapResult1 = numArray.map { (value: Int) -> Int in
            return value * 5
        }
        print(mapResult1) //[5, 10, 15, 20, 25, 30]
        
        //Method 2
        
        let mapResult2 = numArray.map { (value: Int) in
            return value * 2
        }
        print(mapResult2) //[2, 4, 6, 8, 10, 12]
        
        //Method 3
        
        let mapResult3 = numArray.map { (value) in
            return value * 10
        }
        print(mapResult3) //[10, 20, 30, 40, 50, 60]
        
        //Method 4 - 1 line code
        
        let mapResult4 = numArray.map { $0 + 3 }
        print(mapResult4) //[4, 5, 6, 7, 8, 9]
    }
    
    func filter(){
        
        print("-----------Filter-----------")
        //Without using higher order functions - Filter
        
        for num in numArray{
            if num % 2 == 0 {
                filterArray.append(num)
            }
        }
        print(filterArray) //[2, 4, 6]
        
        //With using higher order functions - Filter
        
        let filterRes = numArray1.filter { $0 % 3 == 0}
        print(filterRes) //[3, 9, 3]
    }
    
    func reduce(){
        
        print("-----------Reduce-----------")
        //Without using higher order functions - Reduce
        
        var sumReduce : Int = 0
        for num in numArray1{
            sumReduce += num
        }
        print(sumReduce) //21
        
        //With using higher order functions - Reduce
        
        let numArray2 = [4,8]
        var sumReduce1 = numArray2.reduce( 0, { $0 + $1} )
        print(sumReduce1) //12
        
        //(or)
        
        var sumReduce2 = numArray2.reduce( 0, +)
        print(sumReduce2) //12
        
        //(or)
        let strArray = ["Lavanya","A"]
        var sumReduce3 = strArray.reduce( "", +)
        print(sumReduce3) //LavanyaA
        
        
    }
    
    func flatMap(){
        
        print("-----------FlatMap-----------")
        //WithOut using higher order functions - FlatMap
        
        let flatArray = [[1,2,3],[4,5,6]]
        var flatRes : [Int] = []
        for num in flatArray{
            flatRes += num
        }
        print(flatRes) //[1, 2, 3, 4, 5, 6]
        
        //With using higher order functions - FlatMap
        
        let flatArray1 = [[1,2,3],[4,5,6,7]]
        let flatRes1 = flatArray1.flatMap { $0 }
        print(flatRes1) //[1, 2, 3, 4, 5, 6, 7]
        
        //(or)
        
        let flatArraystr = ["Lavanya",nil,"Akurathi",nil]
        let flatRes2 = flatArraystr.flatMap { $0 }
        print(flatRes2) //["Lavanya", "Akurathi"]
    }
    
    func sorting(){
        
        print("-----------Sorting-----------")
        //With using higher order functions - Sorting
        
        let sorArray = numArray.sorted { $0 > $1 }
        print(sorArray) //[6, 5, 4, 3, 2, 1]
    }
    
    func chaining(){
        
        print("-----------Chaining-----------")
        
        //With using higher order functions - Chaining
        
        let chainArray = [[11,12,13],[14,15,16]]
        let chainRes = chainArray.flatMap{ $0 }.filter{ $0 % 2 == 0}.map{ $0 * $0 }
        print(chainRes)
        //flatMap [11, 12, 13, 14, 15, 16]
        //filter [12, 14, 16]
        //map [144, 196, 256]
        
        //(or)
        let chainRes1 = chainArray.flatMap{ $0 }.map{ "$\($0)" }
        print(chainRes1)
        //flatMap [11, 12, 13, 14, 15, 16]
        //map ["$11", "$12", "$13", "$14", "$15", "$16"]
    }
    
}

