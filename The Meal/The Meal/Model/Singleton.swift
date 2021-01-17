//
//  Singleton.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation

class Singleton{
    
    static let instance = Singleton()
    
//    var meals = [Meal(id: "010101", title: "Chicken Test", drinkAlternative: "Bera", category: "cateogy", area: "area", instructions: ["faz a", "Faz b", "Faz c"], thumb: "https://www.themealdb.com/images/media/meals/1529446352.jpg", video: "https://www.youtube.com/watch?v=IO0issT0Rmc", ingredients: [MealIngredient(ingredient: "Trigo", measure: "1 cx"), MealIngredient(ingredient: "Oleo", measure: "1 cx"), MealIngredient(ingredient: "Açucar", measure: "2 colheres sopa")])]
    
    var meals :[Meal] = []
}
