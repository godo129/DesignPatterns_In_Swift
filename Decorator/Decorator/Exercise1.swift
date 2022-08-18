//
//  Exercise.swift
//  Decorator
//
//  Created by hong on 2022/08/18.
//

import Foundation

protocol shape: CustomStringConvertible
{
    init()
    var description: String { get }
}

protocol canFly : shape
{
    func fly() -> String
}

protocol canCrawl : shape
{
    func crawl() -> String
}

class Bird: canFly
{
    var age = 0
    
    required init() {}
    
    func fly() -> String
    {
        return (age < 10) ? "flying" : "too old"
    }
    
    var description: String
    {
        return "Bird's age is \(age) and \(fly())"
    }
}

class Lizard: canCrawl
{
    var age = 0
    
    
    required init() {}
    
    func crawl() -> String
    {
        return (age > 1) ? "crawling" : "too young"
    }
    
    var description: String
    {
        return "Lizard's age is \(age) and \(crawl())"
    }
}

class Dragon<T>: canFly, canCrawl where T : shape
{
    // todo: reuse bird/lizard functionality here
    
    private var shape : T = T()
    
    required init() {}
        
    var age: Int = 0
    func fly() -> String { return "dragon Flying" }
    func crawl() -> String { return "dragon Crawling" }
    
    var description: String
    {
        return "\(shape)"
    }
}

//func main()
//{
//    let LizardDragon = Dragon<Lizard>()
//    print(LizardDragon)
//    
//    let BirdDragon = Dragon<Bird>()
//    print(BirdDragon)
//}
