//
//  VideoTableViewCell.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 17/01/21.
//

import UIKit
import youtube_ios_player_helper

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var playerView: YTPlayerView!
    
    static let identifier = "VideoTableViewCell"
    static let height : CGFloat = 222.0
    
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
    
    func setupCell(videoId :String){
        setupStyle()
        self.playerView.load(withVideoId: videoId)
    }
    
}
