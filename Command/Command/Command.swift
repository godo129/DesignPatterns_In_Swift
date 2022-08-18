//
//  Command.swift
//  Command
//
//  Created by hong on 2022/08/18.
//

import Foundation

class BankAccount : CustomStringConvertible
{
    private var balance = 0
    private let overdraftLimit = -500
    
    func deposit(_ amount: Int)
    {
        balance += amount
        print("Disposited \(amount), balance = \(balance)")
    }
    
    func withdraw(_ amount: Int) -> Bool
    {
        if (balance - amount >= overdraftLimit)
        {
            balance -= amount
            print("Withdraw \(amount), balance is now \(balance)")
            return true
        }
        return false
    }
    
    var description: String
    {
        return "Balance = \(balance)"
    }
}

protocol command
{
    func call()
    func undo()
}

class BankAccountCommand : command
{
    private var account: BankAccount
    
    enum Action
    {
        case deposit
        case withdraw
    }
    
    private var action : Action
    private var amount : Int
    private var succeeded = false
    
    init (_ account: BankAccount, _ action: Action, _ amount: Int)
    {
        self.account = account
        self.action = action
        self.amount = amount
    }
    
    func call()
    {
        switch action {
        case .deposit:
            account.deposit(amount)
            succeeded = true
        case .withdraw:
            succeeded = account.withdraw(amount)
        }
    }
    
    func undo()
    {
        // 성공했을 때만 가능하게
        if !succeeded { return }
        switch action
        {
            case .deposit:
                account.withdraw(amount)
            case .withdraw:
                account.deposit(amount)
        }
    }
    
}

func main()
{
    let ba = BankAccount()
    
    let commands = [
        BankAccountCommand(ba, .deposit, 100),
        BankAccountCommand(ba, .withdraw, 25)
    ]
    
    print(ba)
    
    commands.forEach{$0.call()}
    
    print(ba)
    
    commands.reversed().forEach{ $0.undo() }
    
    print(ba)
}
