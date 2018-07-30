//
//  Level8_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level8_ViewController: UIViewController {
    
    var timer8 = Timer()
    var Score8 = 0
    var Highscore8 = 100000000000

    @IBOutlet weak var ScoreLblLvl8: UILabel!
    
    @IBOutlet weak var StartLvl8: UIButton!
    
    @IBOutlet weak var StopLvl8: UIButton!
    
    @IBOutlet weak var nextBtn8: UIButton!
    
    @IBOutlet weak var ResetLvl8: UIButton!
    
    @IBOutlet weak var HighScoreLbl8: UILabel!
    
    @IBAction func StartActionLvl8(_ sender: Any) {
        timer8 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level8_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        StartLvl8.isHidden = true
        StopLvl8.isHidden = false
        
        ResetLvl8.isEnabled = false
        
    }
    
    @objc func updateCountdown() {
        Score8 += 1
        
        //Set counter in UILabel
        ScoreLblLvl8.text! = String(format: "%02d:%02d:%02d", Score8 / 3600, (Score8 % 3600) / 60, (Score8 % 3600) % 60)
       
    }
    
    @IBAction func StopActionLvl8(_ sender: Any) {
        timer8.invalidate()
        
        if ((Highscore8 > Score8) && (Score8 != 0))  {
            Highscore8 = Score8
            HighScoreLbl8.text = String(format: "%02d:%02d:%02d", Highscore8 / 3600, (Highscore8 % 3600) / 60, (Highscore8 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore8, forKey: "Highscore12345047")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        StartLvl8.isHidden = false
        StopLvl8.isHidden = true
        
        ResetLvl8.isEnabled = true
        StartLvl8.isEnabled = false
        
        if (Highscore8 < 50){
            nextBtn8.isHidden = false
            nextBtn8.isEnabled = true

        } else {
            nextBtn8.isHidden = true
            nextBtn8.isEnabled = false
        }
        
    
    }
    
    @IBAction func ResetActionLvl8(_ sender: Any) {
        Score8 = 0
        StopActionLvl8(sender)
        ScoreLblLvl8.text! = String(format: "%02d:%02d:%02d", Score8 / 3600, (Score8 % 3600) / 60, (Score8 % 3600) % 60)
        
        StopLvl8.isHidden = true
        StartLvl8.isHidden = false
        
        ResetLvl8.isEnabled = false
        
        StartLvl8.isEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore12345047") != nil) {
            Highscore8 = HighscoreDefault.value(forKey: "Highscore123") as! Int
            HighScoreLbl8.text = String(format: "%02d:%02d:%02d", Highscore8 / 3600, (Highscore8 % 3600) / 60, (Highscore8 % 3600) % 60)
            
        }
        
        StartLvl8.isHidden = false
        StopLvl8.isHidden = true
        
        ResetLvl8.isEnabled = false
        
        if (Highscore8 < 50){
            nextBtn8.isHidden = false
            nextBtn8.isEnabled = true
            
            
        } else {
            nextBtn8.isHidden = true
            nextBtn8.isEnabled = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
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
