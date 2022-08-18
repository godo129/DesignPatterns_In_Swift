//
//  Static Decorator Composition.swift
//  Decorator
//
//  Created by hong on 2022/08/18.
//

import Foundation


protocol Shape : CustomStringConvertible
{
    init() 
    var description: String { get }
}

class Circle: Shape
{
    private var radius: Float = 0
    
    required init() {}
    
    init(_ radius: Float)
    {
        self.radius = radius
    }
    
    func resize(_ factor: Float)
    {
        radius *= factor
    }
    
    var description: String
    {
        return "A circle of radius \(radius)"
    }
}


class Square : Shape
{
    private var side : Float = 0
    
    required init(){}
    
    init(_ side: Float)
    {
        self.side = side
    }
    
    var description: String
    {
        return "A square with side \(side)"
    }
}

class ColoredShape<T> : Shape where T : Shape
{
    private var shape : T = T()
    private var color : String = "black"
    
    required init(){}
    
    init(_ color: String)
    {
        self.color = color
    }
    
    var description: String
    {
        return "\(shape) has color \(color)"
    }
}

class TransparentShape<T>: Shape where T : Shape
{
    private var shape: T = T()
    private var transparency: Float = 0
    
    required init(){}
    
    init(_ transparency: Float)
    {
        self.transparency =  transparency
    }
    
    var description: String
    {
        return "\(shape) has \(transparency*100) % transparency"
    }
}


//func main()
//{
//
//    let purpleCircle = ColoredShape<Circle>("purple")
//    print(purpleCircle)
//    
//    let purpleHalfSquare = TransparentShape<ColoredShape<Square>>(0.4)
//    print(purpleHalfSquare)
//}
//
