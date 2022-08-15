//
//  Interface Segregation Principle.swift
//  SOLID Design Principles
//
//  Created by hong on 2022/08/15.
//

import Cocoa


class Document
{
        
}

protocol Machine
{
    func print(d: Document)
    func scan(d: Document)
    func fax(d: Document)
    
}

//class MFP : Machine
//{
//    func print(d: Document)
//    //
//}

enum NoRequiredFunctionality : Error
{
    case doesNotFax
    case doesNotScan
    case doesNotPrint
}


//class OldFashionPrinter: Machine
//{
//
//    func print(d: Document)
//    {
//        // ok
//    }
//
//    func fax(d: Document) throws
//    {
//        throw NoRequiredFunctionality.doesNotFax
//    }
//
//    func scan(d: Document) throws
//    {
//        throw NoRequiredFunctionality.doesNotScan
//    }
//}

protocol Printer
{
    func print(d: Document)
}

protocol Scanner
{
    func scan(d: Document)
}

protocol Fax
{
    func fax(d: Document)
}

class OrdinaryPrinter : Printer
{
    func print(d: Document)
    {
        // ok
    }
}

class Photocopier : Printer, Scanner
{
    
    func print(d: Document)
    {
        // ok
    }
    
    func scan(d: Document)
    {
        // ok
    }
    
}

protocol MultiFunctionDevice : Printer, Scanner, Fax
{
}

class MultiFunctionMachine : MultiFunctionDevice
{
    let printer : Printer
    let scanner : Scanner
    
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    
    func print(d: Document)
    {
        
    }
    
    func scan(d: Document)
    {
        
    }
    
    func fax(d: Document)
    {
        
    }
}
