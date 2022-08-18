//
//  Array-Backed Properties.swift
//  Iterator
//
//  Created by hong on 2022/08/19.
//

import Foundation

class Creature: Sequence
{
    var stats = [Int](repeating: 0, count: 3)
    
    private let _strength = 0
    private let _agility = 1
    private let _intelligence = 2
    
    var strength: Int
    {
        get { return stats[_strength] }
        set(value) { stats[_strength] = value }
    }
    
    var agility: Int
    {
        get { return stats[_agility] }
        set(value) { stats[_agility] = value }
    }
    
    var intelligence: Int
    {
        get { return stats[_intelligence] }
        set(value) { stats[_intelligence] = value }
    }
    
    var averageStat : Float
    {
        return Float(stats.reduce(0, +) / stats.count)
    }
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: stats)
    }
    
    
    subscript(index: Int) -> Int
    {
        get { return stats[index] }
        set(value) { stats[index] = value }
    }
    
}

func main()
{
    let c = Creature()
    c.strength = 10
    c.agility = 15
    c.intelligence = 11
    
    print(c.averageStat)
    
    for s in c
    {
        print(s)
    }
}
