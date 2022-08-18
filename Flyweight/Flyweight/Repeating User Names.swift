//
//  Repeating User Names.swift
//  Flyweight
//
//  Created by hong on 2022/08/18.
//

import Foundation

class User
{
    var fullName: String
    
    init(_ fullName: String)
    {
        self.fullName = fullName
    }
    
    var charCount: Int
    {
        return fullName.utf8.count
    }
}

class User2
{
    static var strings = [String]()
    private var names = [Int]()
    
    init(_ fullName: String)
    {
        func getOrAdd(_ s: String) -> Int
        {
            if let idx = type(of: self).strings.firstIndex(of: s)
            {
                return idx
            } else
            {
                type(of: self).strings.append(s)
                return type(of: self).strings.count - 1
            }
        }
        
        names = fullName.components(separatedBy: " ").map { getOrAdd($0) }
    }
    
    static var charCount : Int
    {
        return strings.map { $0.utf8.count }.reduce(0, +)
    }
}

//func main()
//{
//    let user1 = User("John lennon")
//    let user2 = User("Jane fowel")
//    let user3 = User("Jane Doe")
//    
//    let totalChars = user1.charCount + user2.charCount + user3.charCount
//    print("Total number of chars used: \(totalChars)")
//    
//    let user4 = User2("John lennon")
//    let user5 = User2("Jane fowel")
//    let user6 = User2("Jane Doe")
//    print("Total number of chars used: \(User2.charCount)")
//}
//
