//
//  TheMealService.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation
import UIKit

class TheMealService{
    
    private let url = "https://www.themealdb.com/api/json/v1/1/"
    
    func getMealData(param :String, completion: @escaping ([Meal]?) -> Void){
        let url :String
        if param == ""{
            url = "\(self.url)search.php?s=Chicken"
        }else{
            url = "\(self.url)search.php?s=\(param)"
        }
        
        print("URL Request: \(url)")
        ApiResource.request(method: "GET", url: url, params: nil, body: nil){
            (data, error) in
            if let data = data{
                //MARK: Fazer a transformação do response aqui
                let mealsData = self.dictToObjct(mealsData: data as! [String : Any?])
                completion(mealsData)
            }
        }
        
    }
    
    private func dictToObjct(mealsData : [String : Any?]) -> [Meal]{
        
        var meals :[Meal] = []
        
        guard let mealsDict :[[String : Any?]] = mealsData["meals"] as? [[String : Any?]] else { return [] }
        for mealDict in mealsDict{
            let id = mealDict["idMeal"] as! String
            let title = mealDict["strMeal"] as! String
            let drinkAlternative = mealDict["strDrinkAlternate"] as? String
            let category = mealDict["strCategory"] as! String
            let area = mealDict["strArea"] as! String
            let instructionsArray = mealDict["strInstructions"] as! String
            let thumb = mealDict["strMealThumb"] as! String
            let video = mealDict["strYoutube"] as! String
            
            //Get id video
            let videoId :String
            if(video != "" && video != nil){
                videoId = video.components(separatedBy: "v=")[1]
            }else{
                videoId = ""
            }
            
            //Get ingredients
            var ingredients :[MealIngredient] = []
            for i in 1...20{
                let ingredient = mealDict["strIngredient\(i)"] as? String
                let measure = mealDict["strMeasure\(i)"] as? String
                if(ingredient !=  nil && ingredient != ""){
                    let mealIngredient = MealIngredient(ingredient: ingredient!, measure: measure!)
                    ingredients.append(mealIngredient)
                }
            }
            
            //Get instructions
            var instructions :[String] = []
            for instruction in instructionsArray.components(separatedBy: "\r\n"){
                if(instruction != nil && instruction != ""){
                    instructions.append(instruction)
                }
            }
            
            let meal = Meal(id: id, title: title, drinkAlternative: drinkAlternative,
                            category: category, area: area, instructions: instructions,
                            thumb: thumb, video: videoId, ingredients: ingredients)
            meals.append(meal)
        }
        return meals
        
    }
}
