//
//  Exercise.swift
//  Prototype
//
//  Created by hong on 2022/08/15.
//

import Cocoa

protocol Copying2
{
    func clone() -> Self
}

class Point: CustomStringConvertible, Copying2
{
  var x = 0
  var y = 0

  init() {}

  init(x: Int, y: Int)
  {
    self.x = x
    self.y = y
  }
    
    func clone() -> Self {
        return cloneImpl()
    }
    
    func cloneImpl<T>() -> T
    {
        return Point(x: self.x, y: self.y) as! T
    }
    
    var description: String
    {
        return "x : \(x), y : \(y)"
    }
}

class Line : CustomStringConvertible
{
  var start = Point()
  var end = Point()

  init(start: Point, end: Point)
  {
    self.start = start
    self.end = end
  }

  func deepCopy() -> Line
  {
    // todo
      return Line(start: Point(x: 1, y: 1), end: Point(x: 2, y: 2))
  }
    
    func clone() -> Line {
        
        return Line(start: start.clone(), end: end.clone())
        
    }
    

    var description: String
    {
        return "start : \(start.description), end : \(end.description)"
    }
}


func main2() {
    let sp = Point(x: 3, y: 2)
    let ep = Point(x: 5, y: 6)
    
    let line = Line(start: sp, end: ep)
    let line2 = line.clone()
    line2.start = Point(x: 3, y: 4)
    line2.end = Point(x: 6, y: 9)
    
    print(line)
    print(line2)
    
    
}
