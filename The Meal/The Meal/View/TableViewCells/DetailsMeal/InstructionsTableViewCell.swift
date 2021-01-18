//
//  InstructionsTableViewCell.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 17/01/21.
//

import UIKit

class InstructionsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var styleView: UIView!
    @IBOutlet weak var instructionTextView: UITextView!
    
    static let identifier = "InstructionsTableViewCell"
    static let height : CGFloat = 20.0
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupStyle(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.styleView.roundCorners(corners: [.topRight, .bottomRight], radius: 10.0)
        
    }
    
    func setupCell(instruction :String){
        setupStyle()
        self.instructionTextView.text = instruction
    }
    
}
