//
//  PlayerNameVC.swift
//  NeoSoft Task
//
//  Created by Azharuddin Shaikh on 25/01/23.
//

import UIKit

class PlayerNameVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var captain = [Int]()
    var keeper = [Int]()
    var playersBattingData = [Array<String>]()
    var playersBowlingData = [Array<String>]()
    var playerNames = [String]()
    var captainIndex = 0
    var keeperIndex = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerTableViewCell")
        keepersIndex()
        captainsIndex()
    }
    
    func keepersIndex () {
        for i in 0...keeper.count-1 {
            if keeper[i] == 1 {
                keeperIndex = i
            }
        }
    }
    func captainsIndex() {
        for i in 0...captain.count-1 {
            if captain[i] == 1 {
                captainIndex = i
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        cell.player?.text = playerNames[indexPath.row]
        cell.capLbl.isHidden = true
        cell.selectionStyle = .none
        
        if indexPath.row == captainIndex {
            cell.capLbl.isHidden = false
            cell.capLbl.text = "(C)"
        }
        
        if indexPath.row == keeperIndex {
            
            if keeperIndex == captainIndex {
                cell.capLbl.isHidden = false
                cell.capLbl.text = "(C & WK)"
            }
            else {
                cell.capLbl.isHidden = false
                cell.capLbl.text = "(WK)"
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerDetailsVC") as! PlayerDetailsVC
        nextVc.playerBattingData = playersBattingData[indexPath.row]
        nextVc.playerBowlingData = playersBowlingData[indexPath.row]
        navigationController?.pushViewController(nextVc, animated: true)
    }
}


