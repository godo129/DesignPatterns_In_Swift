//
//  Custom String Builder.swift
//  Decorator
//
//  Created by hong on 2022/08/18.
//

import Foundation

class CodeBuilder : CustomStringConvertible
{
    private var buffer: String = ""
    
    init() {}
    init(_ buffer: String)
    {
        self.buffer = buffer
    }
    
    func append(_ s: String) -> CodeBuilder
    {
        buffer.append(s)
        return self
    }
    
    func appendLine(_ s: String) -> CodeBuilder
    {
        buffer.append("\(s)\n")
        return self
    }
    
    static func +=(cb: inout CodeBuilder, s: String)
    {
        cb.buffer.append(s)
    }
    
    var description: String
    {
        return buffer
    }
    
}

//func main()
//{
//    var cb = CodeBuilder()
////    cb.append("glass").append("grass")
//    cb.appendLine("class glass")
//        .appendLine("{")
//    
//    cb += " // testing!\n"
//    
//    cb.appendLine("}")
//    print(cb)
//}
