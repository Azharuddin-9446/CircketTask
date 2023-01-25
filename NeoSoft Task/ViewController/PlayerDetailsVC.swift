//
//  PlayerDetailsVC.swift
//  NeoSoft Task
//
//  Created by Azharuddin Shaikh on 25/01/23.
//

import UIKit

class PlayerDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var playerBowlingData = [String]()
    var playerBattingData = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.battingStrikeRate.text = "Strike Rate :- \(playerBattingData[0])"
        cell.totalRuns.text = "Total Runs :- \(playerBattingData[1])"
        cell.battingStyle.text = "Batting Style :- \(playerBattingData[2])"
        cell.strikeRate.text = "Average :- \(playerBattingData[3])"
        cell.economyRateBowling.text = "Economy Rate :- \(playerBowlingData[0])"
        cell.totalWickets.text = "Total Wickets :- \(playerBowlingData[1])"
        cell.bowlingStyle.text = "Bowling Style :- \(playerBowlingData[2])"
        cell.bowlingAverage.text = "Average :- \(playerBowlingData[3])"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    


}
