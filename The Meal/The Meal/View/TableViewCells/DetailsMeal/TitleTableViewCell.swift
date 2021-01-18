//
//  TitleTableViewCell.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 17/01/21.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "TitleTableViewCell"
    static let height : CGFloat = 75.0
    
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
    
    func setupCell(title :String){
        setupStyle()
        self.titleLabel.text = title
    }
    
}
