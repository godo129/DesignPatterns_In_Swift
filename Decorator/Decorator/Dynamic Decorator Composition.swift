//
//  Dynamic Decorator Composition.swift
//  Decorator
//
//  Created by hong on 2022/08/18.
//

import Foundation


protocol Shape : CustomStringConvertible
{
    var description: String { get }
}

class Circle: Shape
{
    private var radius: Float = 0

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

    init(_ side: Float)
    {
        self.side = side
    }

    var description: String
    {
        return "A square with side \(side)"
    }
}

class ColoredShape : Shape
{
    var shape : Shape
    var color : String

    init(_ shape: Shape, _ color: String)
    {
        self.shape = shape
        self.color = color
    }

    var description: String
    {
        return "\(shape) has color \(color)"
    }
}

class TransparentShape: Shape
{
    var shape: Shape
    var transparency: Float

    init(_ shape: Shape, _ transparency: Float)
    {
        self.shape = shape
        self.transparency =  transparency
    }

    var description: String
    {
        return "\(shape) has \(transparency*100) % transparency"
    }
}


//func main()
//{
//    let square = Square(1.89)
//    print(square)
//
//    let blueSquare = ColoredShape(square, "blue")
//    print(blueSquare)
//
//    let blueHalfTransparentSquare = TransparentShape(square, 0.5)
//    print(blueHalfTransparentSquare)
//}
//
