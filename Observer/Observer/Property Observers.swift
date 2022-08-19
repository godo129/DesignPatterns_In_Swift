//
//  Property Observers.swift
//  Observer
//
//  Created by hong on 2022/08/19.
//

import Foundation


class person
{
    var age: Int = 0
    {
        willSet(newValue)
        {
           print("About to set age to \(newValue)")
        }
        didSet
        {
            print("We just Changed age from \(oldValue) to \(age)")
        }
    }
}

class Demo2
{
    init()
    {
        let p = person()
        p.age = 20
        p.age = 22
    }
}

//func main()
//{
//    let _ = Demo2()
//}
