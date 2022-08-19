//
//  Reflection-Based Printing.swift
//  Visitor
//
//  Created by hong on 2022/08/19.
//

import Foundation


class ExpressionPrinter
{

    func print(_ e: Expression, _ s: inout String)
    {
        if let de = e as? DoubleExpression
        {
            s.append(String(de.value))
        }
        
        else if let ae = e as? AdditionExpression
        {
            s.append("(")
            print(ae.left, &s)
            s.append("+")
            print(ae.right, &s)
            s.append(")")
        }
        
    }
    
}


func main()
{
    let e = AdditionExpression(DoubleExpression(1),
                               AdditionExpression(DoubleExpression(2),
                                                  DoubleExpression(3)))
    
    var s = ""
    let ep = ExpressionPrinter()

    ep.print(e, &s)
    print(s)

    
}
