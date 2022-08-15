//
//  Abstract Factory.swift
//  Factories
//
//  Created by hong on 2022/08/15.
//

import Cocoa

protocol HotDrink
{
    func consume()
}


class Tea: HotDrink
{
    func consume()
    {
        print("This tea is nice but I'd prefer it with lemon.")
    }
}

class Coffe: HotDrink
{
    func consume()
    {
        print("This coffee is delicious!")
    }
}

protocol HotDrinkFactory {
    init()
    func prepare(amount: Int) -> HotDrink
}

class TeaFactory
{
    required init() {}
    func prepare(amount: Int) -> HotDrink
    {
        print("Put in tea bag, boil water, pour \(amount)ml, add lemon, enjoy!")
        return Tea()
    }
}

class CoffeeFactory
{
    required init() {}
    func prepare(amount: Int) -> HotDrink
    {
        print("Grind some beans, boil water, pour \(amount)ml, add cream and sugar")
        return Coffe()
    }
}


class HotDrinkMachine
{
    enum AvailableDrink : String // breaks OCP
    {
        case coffee = "Coffee"
        case tea = "Tea"
        
        static let all = [coffee, tea]
    }
    
    internal var factories = [AvailableDrink: HotDrinkFactory]()
    
    internal var namedFactories = [(String, HotDrinkFactory)]()
    
    init()
    {
        for drink in AvailableDrink.all
        {
            let type = NSClassFromString("demo.\(drink.rawValue)Factory")
            let factory = (type as! HotDrinkFactory.Type).init()
            factories[drink] = factory
            namedFactories.append((drink.rawValue, factory))
        }
    }
    
    func makeDrink() -> HotDrink
    {
        print("Available drinks:")
        for i in 0..<namedFactories.count
        {
            let tuple = namedFactories[i]
            print("\(i): \(tuple.0)")
        }
        let input = Int(readLine()!)!
        return namedFactories[input].1.prepare(amount: 250)
    }
}

func main() {
    let machine = HotDrinkMachine()
    print(machine.namedFactories.count)
    let drink = machine.makeDrink()
    drink.consume()
}
