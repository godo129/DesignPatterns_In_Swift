//
//  Handling Dependent Observable Properties.swift
//  Observer
//
//  Created by hong on 2022/08/19.
//

import Foundation


class Human
{
    private var oldCanVote = false
    
    var age: Int = 0
    {
        willSet(newValue)
        {
            print("About to set age to \(newValue)")
            oldCanVote = canVote
            
        }
        didSet
        {
            print("We just Changed age from \(oldValue) to \(age)")
            
            if age != oldValue
            {
                propertyChanged.raise(("age", age))
            }
            
            if canVote != oldCanVote
            {
                //
                propertyChanged.raise(("canVote", canVote))
                
            }
        }
    }
    
    var canVote: Bool
    {
        return age >= 16
    }
    
    let propertyChanged = Event<(String, Any)>()
}



final class RefBool
{
    var value: Bool
    init(_ value: Bool)
    {
        self.value = value
    }
}




class Human2
{
    private var _age : Int = 0
    
    var age: Int
    {
        get { return age }
        set(value)
        {
            if _age == value { return }
            
            // cache
            let oldCanVote = canVote
            
            var cancelSet = RefBool(false)
            propertyChanging.raise(("age", value, cancelSet))
            
            if cancelSet.value
            {
                return
            }
            
            // assign & notify
            
            _age = value
            propertyChanged.raise(("age", _age))
            
            if oldCanVote != canVote
            {
                propertyChanged.raise(("canVote", canVote))
            }
        }
    }
    
    var canVote: Bool
    {
        return age >= 16
    }
    
    let propertyChanged = Event<(String, Any)>()
    let propertyChanging = Event<(String, Any, RefBool)>()
}


class Demo3
{
    init()
    {
//        let h = Human()
//        h.propertyChanged.addHandler(target: self, handler: Demo3.propChanged)
//        h.age = 20
//        h.age = 22
        
        let h = Human2()
        h.propertyChanged.addHandler(target: self, handler: Demo3.propChanged)
        h.propertyChanging.addHandler(target: self, handler: Demo3.propChanging)
        
        h.age = 20
        h.age = 22
        h.age = 12
    }
    
    func propChanging(args: (String, Any, RefBool))
    {
        if args.0 == "age" && (args.1 as! Int) < 14
        {
            print("Cannot allow to set the age < 14")
            args.2.value = true
        }
    }
    
    func propChanged(args: (String, Any))
    {
        if args.0 == "age"
        {
            print("Person's age has been changed to \(args.1)")
        }
        else if args.0 == "canVote"
        {
            print("Voting status has changed to \(args.1)")
        }
    }
}

func main()
{
    let _ = Demo3()
}
