//
//  Static Strategy.swift
//  Strategy
//
//  Created by hong on 2022/08/19.
//

import Foundation


class TextProcessor2<LS> :
    CustomStringConvertible
where LS: ListStrategy
{
    private var buffer = ""
    private var listStrategy = LS()
    
    
    func appendList(_ items: [String])
    {
        listStrategy.start(&buffer)
        
        for item in items
        {
            listStrategy.addListItem(buffer: &buffer, item: item)
        }
        
        listStrategy.end(&buffer)
    }
    
    func clear()
    {
        buffer = ""
    }
    
    var description: String
    {
        return buffer
    }
}


func main()
{
    let tp = TextProcessor2<MarkdownListStrategy>()
    tp.appendList(["foo","bar","baz"])
    print(tp)
    
    
    let tp2 = TextProcessor2<HTMLListStrategy>()
    tp2.appendList(["foo","bar","baz"])
    print(tp2)
}


