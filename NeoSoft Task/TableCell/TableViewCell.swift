//
//  ViewController.swift
//  NeoSoft Task
//
//  Created by Azharuddin Shaikh on 25/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var strikeRate: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var totalRuns: UILabel!
    @IBOutlet weak var battingStrikeRate: UILabel!
    
    @IBOutlet weak var bowlingAverage: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var totalWickets: UILabel!
    @IBOutlet weak var economyRateBowling: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
