//
//  TextFormatting.swift
//  Flyweight
//
//  Created by hong on 2022/08/18.
//

import Foundation

extension String
{
    func substring(_ location: Int, _ length: Int) -> String?
    {
        guard self.count >= location + length else {return nil}
        let start = index(startIndex, offsetBy: location)
        let end = index(startIndex, offsetBy: location + length)
        return substring(with: start..<end)
    }
}

class FormattedText: CustomStringConvertible
{
    
    private var text: String
    private var capitlize : [Bool]
    
    init(_ text: String)
    {
        self.text = text
        self.capitlize = [Bool](repeating: false, count: text.utf8.count)
    }
    
    func capitalize(_ start: Int, _ end: Int)
    {
        for i in start...end
        {
            capitlize[i] = true
        }
    }
    
    var description: String
    {
        var s = ""
        for i in 0..<text.utf8.count
        {
            let c = text.substring(i, 1)!
            s += capitlize[i] ? c.capitalized : c
        }
        return s
    }
}


class BetterFormattedText: CustomStringConvertible
{
    private var text: String
    private var formatting = [TextRange]()
    
    init(_ text: String)
    {
        self.text = text
    }
    
    func getRange(_ start: Int, _ end: Int) -> TextRange
    {
        let range = TextRange(start, end)
        formatting.append(range)
        return range
    }
    
    var description: String
    {
        var s = ""
        for i in 0..<text.utf8.count
        {
            var c = text.substring(i, 1)!
            for range in formatting
            {
                if range.covers(i) && range.captialize
                {
                    c = c.capitalized
                }
            }
            
            s += c
        }
        
        return s
    }
    
    class TextRange
    {
        var start, end: Int
        var captialize = false
        
        init(_ start: Int, _ end: Int)
        {
            self.start = start
            self.end = end
        }
        
        func covers(_ position: Int) -> Bool
        {
            return position >= start && position <= end
        }
    }
}


func main()
{
    let ft = FormattedText("This is a new world")
    ft.capitalize(5, 10)
    print(ft)
    
    let bft = BetterFormattedText("This is a new world")
    bft.getRange(5, 10).captialize = true
    print(bft)
}
