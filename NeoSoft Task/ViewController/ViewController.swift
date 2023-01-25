//
//  ViewController.swift
//  NeoSoft Task
//
//  Created by Azharuddin Shaikh on 25/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var venueLbl: UILabel!
    @IBOutlet weak var disView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    var captain = [Int]()
    var keeper = [Int]()
    var keeper2 = [Int]()
    var captain2 = [Int]()
    var playersBattingData1 = [Array<String>]()
    var playersBowlingData1 = [Array<String>]()
    var playerNamesOfTeamOne = [String]()
    var playerNamesOfTeamTwo = [String]()
    var battingDataOfPlayers = [String:String]()
    var playersBattingData = [Array<String>]()
    var playersBowlingData = [Array<String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disView.layer.masksToBounds = false
        disView.layer.shadowOffset = CGSize(width: -1, height: 1)
        disView.layer.shadowRadius = 1
        disView.layer.shadowOpacity = 0.5
        callMatch()
        
    }
    
    @IBAction func indiaBtn(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PlayerNameVC") as? PlayerNameVC
        vc?.playersBattingData = playersBattingData
        vc?.playersBowlingData = playersBowlingData
        vc?.playerNames = playerNamesOfTeamOne
        vc?.captain = captain2
        vc?.keeper = keeper2
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func nzBtn(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PlayerNameVC") as? PlayerNameVC
        vc?.playersBattingData = playersBattingData1
        vc?.playersBowlingData = playersBowlingData1
        vc?.playerNames = playerNamesOfTeamTwo
        vc?.captain = captain
        vc?.keeper = keeper
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ViewController {
    
    func callMatch() {
        
        let sharedSession = URLSession.shared
        if let url = URL(string: "https://demo.sportz.io/sapk01222019186652.json")
        {
            let request = URLRequest(url: url)
            
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { [self] (data, response, error) -> Void in
                
                
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                
                let matchDetails = json?.value(forKey: "Matchdetail") as? NSDictionary
                
                let match = matchDetails?.value(forKey: "Match") as? NSDictionary
                let venue = matchDetails?.value(forKey: "Venue") as? NSDictionary
                
                let venues = venue?.value(forKey: "Name") as? String
                let time = match?.value(forKey: "Time") as? String
                let date = match?.value(forKey: "Date") as? String
                
                
                DispatchQueue.main.async {
                    self.dateLbl.text = "Date :- \(date ?? "")"
                    self.timeLbl.text = "Time :- \(time ?? "")"
                    self.venueLbl.text = "Venue :- \(venues ?? "")"
                }
                
                
                
                //Teams Data
                let teamsData = json?.value(forKey: "Teams") as? NSDictionary
                let key = teamsData?.allKeys
                
                
                
                
                let key1 = key?[0] as? NSString ?? ""
                let key2 = key?[1] as? NSString ?? ""
                
                
                let nData = (teamsData as AnyObject).value(forKey: key1 as String) as? NSDictionary ?? [:]
                let team1Name = nData.value(forKey: "Name_Full") as? NSString ?? ""
                let sevenData = (teamsData as AnyObject).value(forKey: key2 as String) as? NSDictionary ?? [:]
                let team2Name = sevenData.value(forKey: "Name_Full") as? NSString ?? ""
                
                DispatchQueue.main.async {
                    self.firstBtn.setTitle(team1Name as String, for: .normal)
                    self.secondBtn.setTitle(team2Name as String, for: .normal)
                }
                
               
                
                
                let playerData = (nData as AnyObject).value(forKey: "Players") as? [String:Any]
                let playerData2 = (sevenData as AnyObject).value(forKey: "Players") as? [String:Any]
                
                
                let keysArray = playerData?.keys
                let keys2Array = playerData2?.keys
                
                
                
                
                for i in  keys2Array!{
                    let dataDict1 = playerData2![i] as? NSDictionary ?? [:]
                    //                    print(dataDict1.value(forKey: "Name_Full"))
                    
                    let dataOfaPlayers1 = dataDict1.value(forKey: "Name_Full")
                    let dataOfCaptain = dataDict1.value(forKey: "Iscaptain")
                    let dataOfKeeper = dataDict1.value(forKey: "Iskeeper")
                    
                    self.captain.append(dataOfCaptain as? Int ?? 0)
                    self.keeper.append(dataOfKeeper as? Int ?? 0)
                    
                    let battingDataOfPlayers1 = dataDict1.value(forKey: "Batting") as? NSDictionary
                    //                     print(battingDataOfPlayers1?.allValues)
                    let bowlingDataOfPlayers1 = dataDict1.value(forKey: "Bowling") as? NSDictionary
                    //                     print(bowlingDataOfPlayers1?.allValues)
                    let arrayOfPlayersBowlingData1 = bowlingDataOfPlayers1?.allValues as? [String]
                    self.playersBowlingData1.append(arrayOfPlayersBowlingData1!)
                    
                    let arrayOfPlayersStats1 = battingDataOfPlayers1?.allValues as? [String]
                    //                    print(arrayOfPlayersStats1)
                    self.playersBattingData1.append(arrayOfPlayersStats1!)
                    
                    self.playerNamesOfTeamTwo.append(dataOfaPlayers1 as! String)
                    //  self.frontValueArray.append(value as? String ?? "")
                }
                print(self.keeper)
                print(self.playersBattingData1)
                
                
                //india Team
                
                
                
                for i in  keysArray!{
                    let dataDict = playerData![i] as? NSDictionary ?? [:]
                    
                    
                    let dataOfaPlayers = dataDict.value(forKey: "Name_Full")
                    
                    let dataOfCaptain = dataDict.value(forKey: "Iscaptain")
                    
                    let dataOfKeeper = dataDict.value(forKey: "Iskeeper")
                    
                    
                    self.keeper2.append(dataOfKeeper as? Int ?? 0)
                    self.captain2.append(dataOfCaptain as? Int ?? 0)
                    
                    let battingDataOfPlayers = dataDict.value(forKey: "Batting") as? NSDictionary
                    
                    let bowlingDataOfPlayers = dataDict.value(forKey: "Bowling") as? NSDictionary
                    
                    let arrayOfPlayersBowlingData = bowlingDataOfPlayers?.allValues as? [String]
                    self.playersBowlingData.append(arrayOfPlayersBowlingData!)
                    
                    let arrayOfPlayersStats = battingDataOfPlayers?.allValues as? [String]
                    
                    self.playersBattingData.append(arrayOfPlayersStats!)
                    
                    self.playerNamesOfTeamOne.append(dataOfaPlayers as! String)
                    
                }
                
                print(self.playerNamesOfTeamOne)
                
            })
            
            dataTask.resume()
            
        }
    }
}

