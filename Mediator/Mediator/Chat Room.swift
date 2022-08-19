//
//  Chat Room.swift
//  Mediator
//
//  Created by hong on 2022/08/19.
//

import Foundation


class Person
{
    var name : String
    var room : ChatRoom? = nil
    private var chatLog = [String]()
    
    init(_ name: String)
    {
        self.name = name
    }
    
    func receive(sender: String, message: String)
    {
        let s = "\(sender) : \(message)"
        print("[\(name)'s chat session] \(s)")
        chatLog.append(s)
    }
    
    func say(_ message: String)
    {
        room?.broadcast(sender: name, message: message)
    }
    
    func pm (to target: String, message: String)
    {
        room?.message(sender: name, destination: target, message: message)
    }
}

class ChatRoom
{
    private var people = [Person]()
    
    func broadcast(sender: String, message: String)
    {
        for p in people
        {
            if p.name != sender
            {
                p.receive(sender: sender, message: message)
            }
        }
    }
    
    func join(_ p: Person)
    {
        let joinMsg = "\(p.name) joins the cat"
        broadcast(sender: "room", message: joinMsg)
        p.room = self
        people.append(p)
    }
    
    
    func message(sender: String, destination: String, message: String)
    {
        people.first { $0.name == destination }?.receive(sender: sender, message: message)
    }
    
}

func main()
{
    let room = ChatRoom()
    
    let Tim = Person("Tim")
    let Burton = Person("Burton")
    
    room.join(Tim)
    room.join(Burton)
    
    Tim.say("hi Burton")
    Burton.say("oh, hey Tim")
    
    
    let Tom = Person("Tom")
    room.join(Tom)
    
    Tom.say("hi everyone~!")
    
    Burton.pm(to: "Tom", message: "glad you could join us!")
}
