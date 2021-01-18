//
//  The_MealTests.swift
//  The MealTests
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import XCTest
@testable import The_Meal

class The_MealTests: XCTestCase {
    
    var theMealService  :TheMealService!
    
    
    override func setUp() {
        super.setUp()
    }
    
    //check if you build the objects correctly
    func testDictToObjctTheMealService(){
        self.theMealService = TheMealService()
        self.theMealService.getMealData(param: "Chicken"){ (meals) in
            if let meals = meals{
                for m in meals{
                    if(m.title == "Chicken Handi"){
                        
                        //Check id
                        XCTAssertEqual(m.id, "52795", "Mael id is equal to 52795")
                        
                        //Check video
                        XCTAssertEqual(m.video, "IO0issT0Rmc", "Meal video is equal to IO0issT0Rmc")
                        
                        //Check first ingredient
                        XCTAssertEqual(m.ingredients[0].ingredient, "Chicken", "Frist meal ingredient is equal to Chicken")
                        
                    }
                }
            }
            
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
