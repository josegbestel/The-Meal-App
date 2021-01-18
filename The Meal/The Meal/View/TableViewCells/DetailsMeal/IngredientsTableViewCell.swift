//
//  IngredientsTableViewCell.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 17/01/21.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
        
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var styleView: UIView!
    @IBOutlet weak var ingredientImageView: ImageLoader!
    
    static let identifier = "IngredientsTableViewCell"
    static let height : CGFloat = 75.0
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupStyle(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.styleView.roundCorners(corners: [.topRight, .bottomRight], radius: 10.0)
    }
    
    func setupCell(ingredient :MealIngredient){
        setupStyle()
        self.ingredientLabel.text = "\(ingredient.measure) - \(ingredient.ingredient)"
        let endpoint = "https://www.themealdb.com/images/ingredients/"
        let param = ingredient.ingredient.replacingOccurrences(of: " ", with: "%20")
        let urlString = "\(endpoint)\(param).png"
        
        self.ingredientImageView.loadImageWithUrl(URL(string: urlString)!)
        
    }
    
    
    
}
