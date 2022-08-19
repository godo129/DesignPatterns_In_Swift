//
//  Null Object.swift
//  Null Object
//
//  Created by hong on 2022/08/19.
//

import Foundation

protocol Log
{
    func info(_ msg: String)
    func warn(_ msg: String)
}

class ConsoleLog : Log
{
    func info(_ msg: String)
    {
        print(msg)
    }
    
    func warn(_ msg: String)
    {
        print("WARNING : \(msg)")
    }
}

class BankAccount
{
    var log: Log
    var balance = 0
    
    init(_ log: Log)
    {
        self.log = log
    }
    
    func deposit(_ amount: Int)
    {
        balance += amount
        log.info("Deposited \(amount), balance is now \(balance)")
    }
    
}

class NullLog : Log
{
    func info(_ msg: String) {print("no log")}
    func warn(_ msg: String) {}
}

func main()
{
    let log = ConsoleLog()
    let ba1 = BankAccount(log)
    ba1.deposit(120)
    
    let nullLog = NullLog()
    let ba2 = BankAccount(nullLog)
    ba2.deposit(300)
}
