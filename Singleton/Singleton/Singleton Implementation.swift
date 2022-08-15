//
//  Singleton Implementation.swift
//  Singleton
//
//  Created by hong on 2022/08/15.
//

import Cocoa


protocol Database
{
    func getPopulation(name: String) -> Int
}

class SingletonDatabase : Database
{
    var captials = [String: Int]()
    static var instanceCount = 0
    
    // singleton
    static let instance = SingletonDatabase()
    
    private init()
    {
        type(of: self).instanceCount += 1
        print("initializing database")
        
        let path = "/Users/hong/capitals"
        if let text = try? String(contentsOfFile: path, encoding: .utf8)
        {
            let string = text.components(separatedBy: .newlines)
                .filter { !$0.isEmpty }
                .map { $0.trimmingCharacters(in: .whitespaces) }
            for i in 0..<string.count/2
            {
                captials[string[i*2]] = Int(string[i*2+1])!
            }
        }
    }
    
    func getPopulation(name: String) -> Int
    {
        return captials[name]!
    }
}


class ConfigurableRecordFinder
{
    let database : Database
    init(_ database: Database)
    {
        self.database = database
    }
    
    func totalPopulation(_ names: [String]) -> Int
    {
        var result = 0
        for name in names
        {
            result += database.getPopulation(name: name)
        }
        return result
    }
}

class DummyDatabase : Database
{
    func getPopulation(name: String) -> Int
    {
        return ["alpha":1, "beta":2, "gamma":3][name]!
    }
}



class SingletonRecordFinder
{
    func totalPopulation(_ names: [String]) -> Int
    {
        var result = 0
        for name in names
        {
            result += SingletonDatabase.instance.getPopulation(name: name)
        }
        return result
    }
}

//func main()
//{
//    let db = SingletonDatabase.instance
//    var city = "Seoul"
//    print("\(city) has population \(db.getPopulation(name: city))")
//    print(SingletonDatabase.instanceCount)
//    
//    let db2 = SingletonDatabase.instance
//    city = "Tokyo"
//    print("\(city) has population \(db.getPopulation(name: city))")
//    print(SingletonDatabase.instanceCount)
//
//}
