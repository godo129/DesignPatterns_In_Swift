//
//  main.swift
//  Bridge
//
//  Created by hong on 2022/08/16.
//

import Foundation


protocol Renderer
{
    func renderCircle(_ radius: Float)
}

class VectorRenderer : Renderer
{
    func renderCircle(_ radius: Float)
    {
        print("Drawing a circle of radius \(radius)")
    }
}


class RasterRenderer : Renderer
{
    func renderCircle(_ radius: Float)
    {
        print("Drawing a pixels for circle of radius \(radius)")
    }
}


protocol shape
{
    func draw()
    func resize(_ factor: Float)
}

class Circle : shape
{
    var radius : Float
    var renderer: Renderer
    
    init(_ renderer: Renderer, _ radius: Float)
    {
        self.renderer = renderer
        self.radius = radius
    }
    
    func draw()
    {
        renderer.renderCircle(radius)
    }
    
    func resize(_ factor: Float)
    {
        radius *= factor
    }
    

}

func main()
{
    let raster = RasterRenderer()
    let vector = VectorRenderer()
    let circle = Circle(raster, 5)
    circle.draw()
    circle.resize(2)
    circle.draw()
}

main()
