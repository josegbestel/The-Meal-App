//
//  DetailsMealViewController.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 17/01/21.
//

import UIKit
import youtube_ios_player_helper

class DetailsMealViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var meal :Meal? = nil
    
    //Define sections
    private let SECTION_VIDEO = 0
    private let SECTION_INFO = 1
    private let SECTION_TITLE_INGREDIENTS = 2
    private let SECTION_INGREDIENTS = 3
    private let SECTION_TITLE_INSTRUCTIONS = 4
    private let SECTION_INSTRUCTIONS = 5
    private let TOTAL_SECTIONS = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        self.setupTableView()
    }
    
    func setupStyle(){
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoTableViewCell.nib(), forCellReuseIdentifier: VideoTableViewCell.identifier)
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: TitleTableViewCell.identifier)
        tableView.register(IngredientsTableViewCell.nib(), forCellReuseIdentifier: IngredientsTableViewCell.identifier)
        tableView.register(InstructionsTableViewCell.nib(), forCellReuseIdentifier: InstructionsTableViewCell.identifier)
        tableView.register(InfoMealTableViewCell.nib(), forCellReuseIdentifier: InfoMealTableViewCell.identifier)
    }
}



extension DetailsMealViewController :UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.TOTAL_SECTIONS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == SECTION_INSTRUCTIONS{
            return self.meal!.instructions.count
        }else if(section == SECTION_INGREDIENTS){
            return self.meal!.ingredients.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case SECTION_VIDEO: //Video
            return VideoTableViewCell.height
        case SECTION_INFO: //Infos
            return InfoMealTableViewCell.height
        case SECTION_TITLE_INGREDIENTS: //Tile ingredients
            return TitleTableViewCell.height
        case SECTION_INGREDIENTS: //Ingredients
            return IngredientsTableViewCell.height
        case SECTION_TITLE_INSTRUCTIONS: //Title Instructions
            return TitleTableViewCell.height
        default: //Instructions
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case SECTION_VIDEO: //Video
            let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as! VideoTableViewCell
            print("video id: \(self.meal!.video)")
            cell.setupCell(videoId: self.meal!.video)
            return cell
        case SECTION_INFO:
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoMealTableViewCell.identifier) as! InfoMealTableViewCell
            cell.setupCell(meal: self.meal!)
            return cell
        case SECTION_TITLE_INGREDIENTS: //Title Ingredients
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as! TitleTableViewCell
            cell.setupCell(title: "Ingredients")
            return cell
        case SECTION_INGREDIENTS: //Ingredients
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.identifier) as! IngredientsTableViewCell
            cell.setupCell(ingredient: self.meal!.ingredients[indexPath.row])
            return cell
        case SECTION_TITLE_INSTRUCTIONS: // Title Instructions
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as! TitleTableViewCell
            cell.setupCell(title: "Instructions")
            return cell
        default: //Instructions
            let cell = tableView.dequeueReusableCell(withIdentifier: InstructionsTableViewCell.identifier) as! InstructionsTableViewCell
            cell.setupCell(instruction: meal!.instructions[indexPath.row])
            return cell
        }
    }
    
    
}
