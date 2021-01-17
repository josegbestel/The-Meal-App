//
//  ViewController.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var mealViewModel : MealViewModel!

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var mealsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoadView.shared.show(self.view)
        callToViewModelForUIUpdate()
        
        setupStyle()
        mealsTableView.delegate = self
        mealsTableView.dataSource = self
        mealsTableView.register(MealTableViewCell.nib(), forCellReuseIdentifier: MealTableViewCell.identifier)
        
    }
    
    //Instantiates the View Model, do the request in the API and update data
    func callToViewModelForUIUpdate(){
        //Start LoadView
        print("================== Start Load ==================")
//        LoadView.shared.show(self.baseView)
        
        self.mealViewModel = MealViewModel()
        self.mealViewModel.bindMealViewModelToController = {
            DispatchQueue.main.async {
                //Stop LoadView
                print("================== Stop Load ==================")
                LoadView.shared.hide()
                self.mealsTableView.reloadData()
            }
        }
    }
    
    func setupStyle(){
        self.baseView.roundCorners(corners: [.topLeft, .topRight], radius: 35.0)
    }


}


extension ViewController :UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mealViewModel.mealData.count
        return Singleton.instance.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let meal = mealViewModel.mealData[indexPath.row]
        let meal = Singleton.instance.meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier) as! MealTableViewCell
        cell.setupCell(meal: meal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MealTableViewCell.height
    }
    
    
}
