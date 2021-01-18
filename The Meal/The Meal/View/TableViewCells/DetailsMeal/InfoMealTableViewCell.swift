//
//  InfoMealTableViewCell.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 17/01/21.
//

import UIKit

class InfoMealTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "InfoMealTableViewCell"
    static let height : CGFloat = 99.0
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupStyle(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func setupCell(meal :Meal){
        setupStyle()
        self.titleLabel.text = meal.title
        self.categoryLabel.text = meal.category
    }
    
}
