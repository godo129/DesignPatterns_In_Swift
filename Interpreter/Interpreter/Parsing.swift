//
//  Parsing.swift
//  Interpreter
//
//  Created by hong on 2022/08/19.
//

import Foundation


protocol Element
{
    var value: Int { get }
}

class Integer : Element
{
    var value: Int
    init(_ value: Int){
        self.value = value
    }
}

class BinaryOperation: Element
{
    enum OpType
    {
        case addition
        case substraction
    }
    
    var opType: OpType
    var left: Element
    var right: Element
    
    init() {
        opType = OpType.addition
        left = Integer(0)
        right = Integer(0)
    }
    init(_ left: Element, _ right: Element, _ opType: Element)
    {
        self.opType = OpType.addition
        self.left = left
        self.right = right
    }
    
    var value : Int
    {
        switch opType {
        case .addition:
            return left.value + right.value
        case .substraction:
            return left.value - right.value
        }
    }
    
}

func parse(_ tokens: [Token]) -> Element
{
    let result = BinaryOperation()
    var haveLHS = false
    
    var i = 0
    while i < tokens.count
    {
        let token = tokens[i]
        
        switch token.tokenType
        {
        case .integer :
            let integer = Integer(Int(token.text)!)
            if !haveLHS
            {
                result.left = integer
                haveLHS = true
            }
            else
            {
                result.right = integer
            }
        case .plus :
            result.opType = .addition
        case .minus :
            result.opType = .substraction
        case .lparen :
            var j = i
            while j < tokens.count
            {
                if tokens[j].tokenType == Token.TokenType.rparen
                {
                    break
                }
                j += 1
            }
            // process subexpression without opening
            let subexpression = tokens[(i+1)..<j]
            let element = parse(Array(subexpression))
            if !haveLHS
            {
                result.left = element
                haveLHS = true
            }
            else
            {
                result.right = element
            }
            i = j
        default : break
        }
        i += 1
    }
    
    return result
}


func main()
{
    let input = "(13+14)-(12-1)"
    let tokens = lex(input)
    print(tokens)
    
    let parse = parse(tokens)
    print("\(input) = \(parse.value)")
}
