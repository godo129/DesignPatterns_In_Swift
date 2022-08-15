//
//  Copy Prototype.swift
//  Prototype
//
//  Created by hong on 2022/08/15.
//

import Cocoa

//protocol Copying
//{
//    init(copyFrom other: Self)
//}
//
//class Address : CustomStringConvertible, Copying
//{
//    var streetAddress : String
//    var city : String
//    
//    init(_ streetAddress: String, _ city: String)
//    {
//        self.streetAddress = streetAddress
//        self.city = city
//    }
//    
//    required init(copyFrom other: Address)
//    {
//        streetAddress = other.streetAddress
//        city = other.city
//    }
//    
//    var description: String
//    {
//        return "\(streetAddress), \(city)"
//    }
//}
//
//class Employee: CustomStringConvertible
//{
//    var name : String
//    var address : Address
//    
//    init(_ name: String, _ address: Address)
//    {
//        self.name = name
//        self.address = address
//    }
//    
//    init(copyFrom other: Employee)
//    {
//        name = other.name
//        
//        // 1 번째 방법
////        address = Address(other.address.streetAddress, other.address.city)
//        
//        // 2 번째 방법
//        address = Address(copyFrom: other.address)
//    }
//    
//    var description : String
//    {
//        return "My name is \(name) and I live at \(address)"
//    }
//}

//func main()
//{
//    var john = Employee("John", Address("123 Seoul Road", "Seoul"))
//    
//    var chris = Employee(copyFrom: john)
//    chris.name = "Chris"
//    chris.address.streetAddress = "244 Seoul Road"
//    
//    print(john.description)
//    print(chris.description)
//}

