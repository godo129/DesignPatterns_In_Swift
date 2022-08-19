//
//  Memento.swift
//  Memento
//
//  Created by hong on 2022/08/19.
//

import Foundation


class Memento
{
    let balance : Int
    init(_ balance: Int)
    {
        self.balance = balance
    }
}


class BanckAccount: CustomStringConvertible
{
    private var balance : Int
    
    init(_ balance: Int)
    {
        self.balance = balance
    }
    
    func deposit(_ amount: Int) -> Memento
    {
        balance += amount
        return Memento(balance)
    }
    
    func restore(_ m: Memento)
    {
        balance = m.balance
    }
    
    var description: String
    {
        return "Balance = \(balance)"
    }
}


//func main()
//{
//    var ba = BanckAccount(400)
//    let m1 = ba.deposit(50) // 450
//    let m2 = ba.deposit(100) // 550
//    print(ba)
//    
//    // restore to m1
//    ba.restore(m1)
//    print(ba)
//    
//    // restore to m2
//    ba.restore(m2)
//    print(ba)
//}
