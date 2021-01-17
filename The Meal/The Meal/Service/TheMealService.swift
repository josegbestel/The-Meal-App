//
//  TheMealService.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation
import UIKit

class TheMealService{
    
    private let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=Chicken"
    
    func getMealData(completion: @escaping ([Meal]?) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Put your code which should be executed with a delay here
            ApiResource.request(method: "GET", url: self.url, params: nil, body: nil){
                (data, error) in
                if let data = data{
                    //MARK: Fazer a transformação do response aqui
                    let mealsData = self.dictToObjct(mealsData: data as! [String : Any?])
                    completion(mealsData)
                }
            }
        }
        
    }
    
    private func dictToObjct(mealsData : [String : Any?]) -> [Meal]{
        
        var meals :[Meal] = []
        
        let mealsDict :[[String : Any?]] = mealsData["meals"] as! [[String : Any?]]
        
        for mealDict in mealsDict{
            let id = mealDict["idMeal"] as! String
            let title = mealDict["strMeal"] as! String
            let drinkAlternative = mealDict["strDrinkAlternate"] as? String
            let category = mealDict["strCategory"] as! String
            let area = mealDict["strArea"] as! String
            let instructions = mealDict["strInstructions"] as! String
            let thumb = mealDict["strMealThumb"] as! String
            let video = mealDict["strYoutube"] as! String
            
            let meal = Meal(id: id,
                            title: title,
                            drinkAlternative: drinkAlternative,
                            category: category,
                            area: area,
                            instructions: instructions.components(separatedBy: "\r\n"),
                            thumb: thumb,
                            video: video,
                            ingredients: [])
            
            meals.append(meal)
        }
        
        return meals
    }
}
