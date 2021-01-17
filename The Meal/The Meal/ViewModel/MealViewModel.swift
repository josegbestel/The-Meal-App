//
//  MealViewModel.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import Foundation

class MealViewModel : NSObject{
    
    private var theMealService :TheMealService!
    
    //Meals by API
    private(set) var mealData : [Meal]!{
        didSet{
            Singleton.instance.meals = self.mealData
            self.bindMealViewModelToController()
        }
    }
    
    var bindMealViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.theMealService = TheMealService()
        callFuncToGetMealData()
    }
    
    func callFuncToGetMealData(){
        self.theMealService.getMealData{
            (mealData) in
            if let mealData = mealData{
                self.mealData = mealData
            }
        }
    }
}
