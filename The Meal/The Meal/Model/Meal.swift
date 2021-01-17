//
//  Meal.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation
import UIKit

class Meal{
    
    let id :String
    let title :String
    let drinkAlternative :String?
    let category :String
    let area :String
    let instructions :[String]
    let video :String
    let ingredients :[MealIngredient]
    var thumb :String
    
    init(id :String, title :String, drinkAlternative :String?, category :String, area :String, instructions :[String], thumb :String, video :String, ingredients :[MealIngredient]){
        self.id = id
        self.title = title
        self.drinkAlternative = drinkAlternative
        self.category = category
        self.area = area
        self.instructions = instructions
        self.video = video
        self.ingredients = ingredients
        self.thumb = thumb
    }
    
    
}
