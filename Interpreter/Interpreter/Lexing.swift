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
            return !self.isEmpty && (self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil)
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
    var result = [Token]()
    
    var i = 0
    while i < input.count
    {
        switch input[i]
        {
        case "+" :
            result.append(Token(.plus, "+"))
        case "-" :
            result.append(Token(.minus, "-"))
        case "(" :
            result.append(Token(.lparen, "("))
        case ")" :
            result.append(Token(.rparen, ")"))
        default :

            var s = String(input[i])
            for j in (i+1)..<input.count
            {
                if String(input[j]).isNumber
                {
                    s.append(input[j])
                    i += 1
                }
                else
                {
                    result.append(Token(.integer, s))
                    break
                }
            }
        }
        i += 1
    }
    
    return result
}

//func main()
//{
//    let input = "(13+14)-(12-1)"
//    let tokens = lex(input)
//    print(tokens)
//}
