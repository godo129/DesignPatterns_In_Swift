//
//  Lexing.swift
//  Interpreter
//
//  Created by hong on 2022/08/18.
//

import Foundation

extension String
{
    subscript (i: Int) -> Character
    {
        return self[index(startIndex, offsetBy: i)]
    }
    
    var isNumber : Bool
    {
        get {
            return !self.isEmpty && (self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil)
        }
    }
}

struct Token : CustomStringConvertible
{
    enum TokenType
    {
        case integer
        case plus
        case minus
        case lparen
        case rparen
    }
    
    var tokenType: TokenType
    var text: String
    
    init(_ tokenType: TokenType, _ text: String)
    {
        self.tokenType = tokenType
        self.text = text
    }
    
    var description: String
    {
        return "`\(text)`"
    }
}

func lex(_ input: String) -> [Token]
{
    var result = 
}

func main()
{
    let input = "(13+14)-(12-1)"
}
