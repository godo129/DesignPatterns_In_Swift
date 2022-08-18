//
//  Exercise2.swift
//  Decorator
//
//  Created by hong on 2022/08/18.
//

import Foundation


class Bird
{
    var age = 0
    
    func fly() -> String
    {
        return (age < 10) ? "flying" : "too old"
    }
}

class Lizard
{
    var age = 0
    
    func crawl() -> String
    {
        return (age > 1) ? "crawling" : "too young"
    }
}

class Dragon
{
    
    private var _age = 0
    private let bird = Bird()
    private let lizard = Lizard()
    // todo: reuse bird/lizard functionality here
    
    var age: Int {
        get { return _age }
        set(value)
        {
            lizard.age = value
            bird.age = value
            _age = value
        }
    }
    func fly() -> String { return bird.fly() }
    func crawl() -> String { return lizard.crawl() }
}


//func main()
//{
//    let dragon = Dragon()
//    print("age: "+"\(dragon.age)")
//    print(dragon.fly())
//    print(dragon.crawl())
//    print("\n")
//    dragon.age = 10
//    print("age: "+"\(dragon.age)")
//    print(dragon.fly())
//    print(dragon.crawl())
//}
