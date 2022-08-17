//
//  Exercise.swift
//  Composite
//
//  Created by hong on 2022/08/18.
//

import Foundation


class SingleValue : Sequence
{
    var value = 0
    
    init() {}
    init(_ value: Int)
    {
        self.value = value
    }
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: [value])
    }
}

class ManyValues : Sequence
{
    var values = [Int]()
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: values)
    }
    
    func add(_ value: Int)
    {
        values.append(value)
    }
}

extension Sequence where Iterator.Element : Sequence,
                         Iterator.Element.Iterator.Element == Int
{
    func sum() -> Int
    {
        var temp = 0
        // todo
        for i in self
        {
            for v in i
            {
                temp += v
            }
        }
        return temp
    }
}


func main()
{
    
    let singleValue = SingleValue(1)
    let manyValues = ManyValues()
    manyValues.add(2)
    manyValues.add(3)
    
    let s = [AnySequence(singleValue), AnySequence(manyValues)].sum() // s = 6
    print(s)
}
