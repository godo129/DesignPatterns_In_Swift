//
//  Method Chain.swift
//  Chain Of Responsibility
//
//  Created by hong on 2022/08/18.
//

import Foundation


class Creature : CustomStringConvertible
{
    var name : String
    var attack : Int
    var defense : Int
    
    init(name: String, attack: Int, defense: Int)
    {
        self.name = name
        self.attack = attack
        self.defense = defense
    }
    
    
    var description: String
    {
        return "Name: \(name), Attack = \(attack), Defense = \(defense)"
    }
}

class CreatureModifier
{
    let creature : Creature
    var next : CreatureModifier?
    
    init(creature : Creature)
    {
        self.creature = creature
    }
    
    func add(_ cm: CreatureModifier)
    {
        if next != nil
        {
            next!.add(cm)
        }
        else
        {
            next = cm
        }
    }
    
    func handle()
    {
        next?.handle() // handle
    }
    
}


class DoubleAttackModifier : CreatureModifier
{
    override func handle()
    {
        print("Doubling \(creature.name)'s attack")
        creature.attack *= 2
        super.handle()
    }
}

class IncreaseDefenseModifier : CreatureModifier
{
    override func handle()
    {
        print("Increasing \(creature.name)'s defense")
        creature.defense += 3
        super.handle()
    }
}

// can cancell
class NoBonusesModifier : CreatureModifier
{
    override func handle()
    {
        // nothing
        
    }
}


//func main()
//{
//    let Bear = Creature(name: "Bear", attack: 2, defense: 2)
//    print(Bear)
//    
//    let root = CreatureModifier(creature: Bear)
//    
////    root.add(NoBonusesModifier(creature: Bear))
//    
//    print("Let's double the bear's attack")
//    root.add(DoubleAttackModifier(creature: Bear))
//    
//    print("Let's increase bear's defense")
//    root.add(IncreaseDefenseModifier(creature: Bear))
//    
//    root.handle()
//    print(Bear)
//}
