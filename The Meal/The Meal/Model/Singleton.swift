//
//  Singleton.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation

class Singleton{
    
    static let instance = Singleton()
    var meals :[Meal] = []
    var searchParam :String = ""
}
