//
//  PlayerTableViewCell.swift
//  NeoSoft Task
//
//  Created by Azharuddin Shaikh on 25/01/23.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
   
    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var capLbl: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
