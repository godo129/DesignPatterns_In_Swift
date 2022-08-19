//
//  Template Method.swift
//  Template Method
//
//  Created by hong on 2022/08/19.
//

import Foundation


class Game
{
    func run()
    {
        start()
        while !haveWinner
        {
            takeTurn()
        }
        print("Player \(winningPlayer) wins!")
    }
    
    internal func start()
    {
        precondition(false, "this method needs to be overridden")
    }
    
    internal func takeTurn()
    {
        precondition(false, "this method needs to be overridden")
    }
    
    internal var haveWinner: Bool
    {
        get {
            precondition(false, "this method needs to be overridden")
        }
    }

    
    internal var currentPlayer = 0
    internal let numberOfPlayer : Int
    
    init (_ numberOfPlayers: Int)
    {
        self.numberOfPlayer = numberOfPlayers
    }
}


class Chess: Game
{
    private let maxTurns = 10
    private var turn = 1
    
    init()
    {
        super.init(2)
    }
    
    
    override func start()
    {
        print("Starting a game of chess with \(numberOfPlayer) players.")
    }
    
    override var haveWinner: Bool
    {
        return turn == maxTurns
    }
    
    override func takeTurn()
    {
        print("Turn \(turn) taken by player \(currentPlayer)")
        currentPlayer = (currentPlayer + 1) % numberOfPlayer
        turn += 1
    }
    
    override var winningPlayer: Int
    {
        return currentPlayer
    }
}

func main()
{
    let chess = Chess()
    chess.run()
}
