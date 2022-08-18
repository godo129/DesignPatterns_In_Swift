//
//  Protection Proxy.swift
//  Proxy
//
//  Created by hong on 2022/08/18.
//

import Foundation

protocol Vehicle
{
    func drive()
}

class Car
{
    func drive()
    {
        print("Car being driven")
    }
}

class CarProxy: Vehicle
{
    private let car = Car()
    private let driver: Driver
    
    init(driver: Driver)
    {
        self.driver = driver
    }
    
    func drive()
    {
        if driver.age >= 18
        {
            car.drive()
        }
        else
        {
            print("Driver too young")
        }
        
    }
}


class Driver
{
    var age : Int
    init(age: Int)
    {
        self.age = age
    }
}


//func main()
//{
//    let car: Vehicle = CarProxy(driver: Driver(age: 16))
//    car.drive()
//}
