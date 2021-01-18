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
    @IBOutlet weak var searchBar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUIUpdate()
        
        setupStyle()
        setupTableView()
        setupSearchBar()
        
    }
    
    //Instantiates the View Model, do the request in the API and update data
    func callToViewModelForUIUpdate(){
        //Start LoadView
        print("================== Start Load ==================")
        self.mealsTableView.isHidden = true
        LoadView.shared.show(self.view)
        
        
        self.mealViewModel = MealViewModel()
        self.mealViewModel.bindMealViewModelToController = {
            DispatchQueue.main.async {
                //Stop LoadView
                print("================== Stop Load ==================")
                LoadView.shared.hide()
                self.mealsTableView.isHidden = false
                self.mealsTableView.reloadData()
                Singleton.instance.searchParam = ""
            }
        }
    }
    
    func setupStyle(){
        self.baseView.roundCorners(corners: [.topLeft, .topRight], radius: 35.0)
    }
    
    func setupTableView(){
        mealsTableView.delegate = self
        mealsTableView.dataSource = self
        mealsTableView.register(MealTableViewCell.nib(), forCellReuseIdentifier: MealTableViewCell.identifier)
    }
    
    func setupSearchBar(){
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
    }


}


extension ViewController :UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.instance.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = Singleton.instance.meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier) as! MealTableViewCell
        cell.setupCell(meal: meal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MealTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(Singleton.instance.meals[indexPath.row].title)
        //call the details meal
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "DetailsMeal") as! DetailsMealViewController
        destination.meal = Singleton.instance.meals[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
}


extension ViewController : UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //call func to refresh
        Singleton.instance.searchParam = self.searchBar.text!
        self.searchBar.endEditing(true)
        self.callToViewModelForUIUpdate()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //call func to filter table
        print(self.searchBar.text)
    }
    
}
