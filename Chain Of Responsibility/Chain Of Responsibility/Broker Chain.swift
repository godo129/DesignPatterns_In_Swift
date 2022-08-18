//
//  Broker Chain.swift
//  Chain Of Responsibility
//
//  Created by hong on 2022/08/18.
//

import Foundation


protocol Invocable : class
{
  func invoke(_ data: Any)
}

public protocol Disposable
{
  func dispose()
}

public class Event<T>
{
  public typealias EventHandler = (T) -> ()

  var eventHandlers = [Invocable]()

  public func raise(_ data: T)
  {
    for handler in self.eventHandlers
    {
      handler.invoke(data)
    }
  }

  public func addHandler<U: AnyObject>
    (target: U, handler: @escaping (U) -> EventHandler) -> Disposable
  {
    let subscription = Subscription(target: target, handler: handler, event: self)
    eventHandlers.append(subscription)
    return subscription
  }
}

class Subscription<T: AnyObject, U> : Invocable, Disposable
{
  weak var target: T?
  let handler: (T) -> (U) -> ()
  let event: Event<U>

  init(target: T?, handler: @escaping (T) -> (U) -> (), event: Event<U>)
  {
    self.target = target
    self.handler = handler
    self.event = event
  }

  func invoke(_ data: Any) {
    if let t = target {
      handler(t)(data as! U)
    }
  }

  func dispose()
  {
    event.eventHandlers = event.eventHandlers.filter { $0 as AnyObject? !== self }
  }
}


// CQS

class Query
{
    var creatureName : String
    enum Argument
    {
        case attack
        case defense
    }
    
    var whatToQuery: Argument
    var value : Int
    
    init(_ name: String, _ whatToQuery: Argument, _ value: Int)
    {
        self.creatureName = name
        self.whatToQuery = whatToQuery
        self.value = value
    }
}


class Game
{
    let queries = Event<Query>()
    
    func performQuery(_ q: Query)
    {
        queries.raise(q)
    }
}

class Creature: CustomStringConvertible
{
    var name: String
    private let _attack, _defense: Int
    private let game: Game
    
    init(_ game: Game, _ name: String, _ attack: Int, _ defense: Int)
    {
        self.game = game
        self.name = name
        _attack = attack
        _defense = defense
    }
    
    var attack: Int
    {
        let q = Query(name, .attack, _attack)
        game.performQuery(q)
        return q.value
    }
    
    var defense: Int
    {
        let q = Query(name, .defense, _defense)
        game.performQuery(q)
        return q.value
    }
    
    var description: String
    {
        return "Name: \(name), Attack = \(attack), Defense = \(defense)"
    }
}


class CreatureModifier : Disposable
{
    let game: Game
    let creature : Creature
    var event: Disposable? = nil
    
    init(_ game: Game, _ creature: Creature)
    {
        self.game = game
        self.creature = creature
        event = self.game.queries.addHandler(target: self, handler: CreatureModifier.handle)
    }
    
    func handle(_ q: Query)
    {
        
    }
    
    func dispose()
    {
        event?.dispose()
    }
}


class DoubleAttackModifier: CreatureModifier
{
    override func handle(_ q: Query)
    {
        if q.creatureName == creature.name && q.whatToQuery == .attack
        {
            q.value *= 2
        }
    }
}


class IncreaseDefenseModifier: CreatureModifier
{
    override func handle(_ q: Query)
    {
        if q.creatureName == creature.name && q.whatToQuery == .defense
        {
            q.value += 2
        }
    }
}


func main()
{
    let game = Game()
    let bear = Creature(game, "Bear", 3, 5)
    print("Baseline : \(bear)")
    
    let dam = DoubleAttackModifier(game, bear)
    print("Bear with double attack : \(bear)")
    
    let idm = IncreaseDefenseModifier(game,bear)
    print("Bear with increase defense : \(bear)")
    
    idm.dispose()
    print("Bear is now \(bear)")
    
    dam.dispose()
    print("Bear is now \(bear)")
}
