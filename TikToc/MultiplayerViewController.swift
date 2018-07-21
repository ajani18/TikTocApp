//
//  MultiplayerViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/18/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class MultiplayerViewController: UIViewController {
    
    //Player 1 Name Tag
    
 
    @IBOutlet weak var player1NameTag: UILabel!
    
    @IBOutlet weak var player1Name: UITextField!
    
    @IBAction func enterP1Name(_ sender: Any) {
        player1NameTag.text = "Player 1: " + (player1Name.text)!
        
    }
    
    //Player 1 Varaibles
    
    var timer = Timer()
    var Score = 0
    var Highscore12 = 100000000000
    
    //Player 1 WeaK Var
    
    @IBOutlet weak var ScoreLbl: UILabel!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var stop: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var HighscoreLbl: UILabel!
    
    //Player 2 Variables
    
    var timer2 = Timer()
    var Score2 = 0
    var highScore = 100000000000
    
    //Player 2 Weak Var
    
    @IBOutlet weak var ScoreLbl2: UILabel!
    
    @IBOutlet weak var start2: UIButton!
    
    @IBOutlet weak var stop2: UIButton!
    
    @IBOutlet weak var reset2: UIButton!
    
    @IBOutlet weak var HighscoreLbl2: UILabel!
    
    //Winner
    
    
    //Player 1 Actions
    
    @IBAction func StartAction(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MultiplayerViewController.updateCountdown), userInfo: nil, repeats: true)

        start.isHidden = true
        stop.isHidden = false
        
        reset.isEnabled = false

        reset2.isEnabled = false
        stop2.isEnabled = false
        start2.isEnabled = false
        
    }
    
    @objc func updateCountdown() {
        Score += 1
        
        //Set counter in UILabel
        ScoreLbl.text! = String(format: "%02d:%02d:%02d", Score / 3600, (Score % 3600) / 60, (Score % 3600) % 60)
        
    }
    
    
    @IBAction func StopAction(_ sender: Any) {
        timer.invalidate()
        
        if ((Highscore12 > Score) && (Score != 0))  {
            Highscore12 = Score
            HighscoreLbl.text = String(format: "%02d:%02d:%02d", Highscore12 / 3600, (Highscore12 % 3600) / 60, (Highscore12 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore12, forKey: "Highscore1")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }

        start.isHidden = false
        stop.isHidden = true

        reset.isEnabled = false
        start.isEnabled = false
        
        start2.isEnabled = true
        stop2.isEnabled = false


    }
    
    @IBAction func ResetAction(_ sender: Any) {
        Score = 0
        StopAction(sender)
        ScoreLbl.text! = String(format: "%02d:%02d:%02d", Score / 3600, (Score % 3600) / 60, (Score % 3600) % 60)
        
        stop.isHidden = true
        start.isHidden = false
        
        start.isEnabled = true
        stop.isEnabled = true
        
        start2.isEnabled = false
        reset.isEnabled = false
        
        
    }
    
    //Player 2 Actions
    
    @IBAction func StartAction2(_ sender: Any) {
        timer2 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MultiplayerViewController.updateCountdownPlayerTwo), userInfo: nil, repeats: true)
        
        start2.isHidden = true
        stop2.isHidden = false

        reset2.isEnabled = false

        stop2.isEnabled = true
        
        
    }
    
    @objc func updateCountdownPlayerTwo() {
        Score2 += 1
        
        //Set counter in UILabel
        ScoreLbl2.text! = String(format: "%02d:%02d:%02d", Score2 / 3600, (Score2 % 3600) / 60, (Score2 % 3600) % 60)
        
    }
    
    @IBAction func StopAction2(_ sender: Any) {
        timer2.invalidate()
        
        if (highScore > Score2) && (Score2 != 0)  {
            highScore = Score2
            HighscoreLbl2.text = String(format: "%02d:%02d:%02d", highScore / 3600, (highScore % 3600) / 60, (highScore % 3600) % 60)
            let HighscoreDefault2 = UserDefaults.standard
            HighscoreDefault2.set(highScore, forKey: "Highscore2")
            HighscoreDefault2.synchronize()
        }
        else {
            print ("ok")
        }
        
        start2.isHidden = false
        stop2.isHidden = true

        reset2.isEnabled = true
        start2.isEnabled = false
        

    }
    

    @IBAction func ResetAction2(_ sender: Any) {
        Score2 = 0
        StopAction2(sender)
        ScoreLbl2.text! = String(format: "%02d:%02d:%02d", Score2 / 3600, (Score2 % 3600) / 60, (Score2 % 3600) % 60)
        
        stop2.isHidden = true
        start2.isHidden = false

        reset2.isEnabled = false
        reset.isEnabled = true
        

        start2.isEnabled = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        stop.isEnabled = false
//        stop2.isEnabled = false
//
//        reset.isEnabled = false
//        reset2.isEnabled = false
//
//        start2.isEnabled = false
//
        stop.isHidden = true
        stop2.isHidden = true
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore1") != nil) {
            Highscore12 = HighscoreDefault.value(forKey: "Highscore1") as! Int
            HighscoreLbl.text = String(format: "%02d:%02d:%02d", Highscore12 / 3600, (Highscore12 % 3600) / 60, (Highscore12 % 3600) % 60)
            
        let HighscoreDefault2 = UserDefaults.standard
        if (HighscoreDefault2.value(forKey: "Highscore2") != nil) {
            highScore = HighscoreDefault2.value(forKey: "Highscore2") as! Int
            HighscoreLbl2.text = String(format: "%02d:%02d:%02d", highScore / 3600, (highScore % 3600) / 60, (highScore % 3600) % 60)
    }

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }
  }
}
