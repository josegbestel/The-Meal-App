//
//  MealTableViewCell.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import UIKit
import Foundation

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var thumb: ImageLoader!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var category: UILabel!

    static let identifier = "MealTableViewCell"
    static let height : CGFloat = 120.0
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    func setupStyle(){
        self.contentView.layer.cornerRadius = 20.0
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func setupCell(meal :Meal){
        setupStyle()
        self.title.text = meal.title
        self.area.text = meal.area
        self.category.text = meal.category
        
        self.thumb.image = UIImage(named: "meal-placeholder")
//        self.thumb.downloaded(from: meal.thumb)
        guard let url = URL(string: meal.thumb) else { return }
        self.thumb.loadImageWithUrl(url)
    }
    
}
