//
//  Exercises.swift
//  Builder
//
//  Created by hong on 2022/08/15.
//

import Cocoa

class person {
    var name : String = ""
    var age : Int = 0
}

class CodeBuilder: CustomStringConvertible {
    
    var fields = [(String,String)]()
    var rootName: String
    
    init(_ rootName: String)
    {
        self.rootName = rootName
    }
    
    
    func addField(called name: String, ofType type: String) -> CodeBuilder
    {
        let field = (name, type)
        fields.append(field)
        return self
    }
    
    public var description: String
    {
        return fields.reduce("", {$0 + "\($1.0)   \($1.1)\n"})
    }
    
}

func main() {
    
    let cb = CodeBuilder("Person")
        .addField(called: "name", ofType: "String")
        .addField(called: "age", ofType: "Int")
    
    print(cb)
}
