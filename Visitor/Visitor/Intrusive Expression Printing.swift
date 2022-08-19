//
//  Intrusive Expression Printing.swift
//  Visitor
//
//  Created by hong on 2022/08/19.
//

import Foundation

protocol Expression
{
    func print(_ buffer: inout String)
}


class DoubleExpression: Expression
{
    var value: Double
    init(_ value: Double)
    {
        self.value = value
    }
    
    func print(_ buffer: inout String)
    {
        buffer.append(String(value))
    }
    
}


class AdditionExpression: Expression
{
    var left, right : Expression
    init(_ left: Expression, _ right: Expression)
    {
        self.left = left
        self.right = right
    }
    
    func print(_ buffer: inout String)
    {
        buffer.append("(")
        left.print(&buffer)
        buffer.append("+")
        right.print(&buffer)
        buffer.append(")")
    }
    
}


func main()
{
    // 1 + (2+3)
    let e = AdditionExpression(DoubleExpression(1),
                               AdditionExpression(DoubleExpression(2),
                                                  DoubleExpression(3)))
    
    var s = ""
    let ep = ExpressionPrinter()
    
    e.print(&s)
    print(s)


}
