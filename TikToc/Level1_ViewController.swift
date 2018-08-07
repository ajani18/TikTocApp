//
//  Level1_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/24/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level1_ViewController: UIViewController {
    
    var timer = Timer()
    var Score = 0
    var Highscore123 = 100000000000
    
    @IBAction func TutorialAction(_ sender: Any) {
        createAlert(title: "Level 1 Tutorial", message: "Tap Start. Stop. and get a time below 0.50 seconds and hit Reset to start again.")
    }
    
    @IBOutlet weak var resetLvl1: UIButton!
    
    @IBOutlet weak var startLvl1: UIButton!
    
    @IBOutlet weak var ScoreLblLvl1: UILabel!
    
    @IBOutlet weak var stopLvl1: UIButton!
    
    @IBOutlet weak var NextBtn: UIButton!
    
    @IBOutlet weak var highScoreLvl1: UILabel!
    
    @IBAction func StartActionLevel1(_ sender: Any) {
        //Schedule a timer
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level1_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        startLvl1.isHidden = true
        stopLvl1.isHidden = false
        
        resetLvl1.isEnabled = false
        
    }
    
    @objc func updateCountdown() {
        Score += 1
        
        //Set counter in UILabel
        ScoreLblLvl1.text! = String(format: "%02d:%02d.%02d", Score / 3600, (Score % 3600) / 60, (Score % 3600) % 60)
        
    }
    
    @IBAction func ResetActionLevel1(_ sender: Any) {
        Score = 0
        StopActionLevel1(sender)
        ScoreLblLvl1.text! = String(format: "%02d:%02d.%02d", Score / 3600, (Score % 3600) / 60, (Score % 3600) % 60)
        
        stopLvl1.isHidden = true
        startLvl1.isHidden = false
        
        resetLvl1.isEnabled = false
        
        startLvl1.isEnabled = true
        
    }
    
    @IBAction func StopActionLevel1(_ sender: Any) {
        timer.invalidate()
        
        if ((Highscore123 > Score) && (Score != 0))  {
            Highscore123 = Score
            highScoreLvl1.text = String(format: "%02d:%02d.%02d", Highscore123 / 3600, (Highscore123 % 3600) / 60, (Highscore123 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore123, forKey: "Highscore123")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
//        let HighScore123 = Double(Highscore123)
        
     
        startLvl1.isHidden = false
        stopLvl1.isHidden = true
        
        resetLvl1.isEnabled = true
        startLvl1.isEnabled = false
        
        if (Highscore123 < 50){
            NextBtn.isHidden = false
            NextBtn.isEnabled = true
            
        } else {
            NextBtn.isHidden = true
            NextBtn.isEnabled = false
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore123") != nil) {
            Highscore123 = HighscoreDefault.value(forKey: "Highscore123") as! Int
            highScoreLvl1.text = String(format: "%02d:%02d.%02d", Highscore123 / 3600, (Highscore123 % 3600) / 60, (Highscore123 % 3600) % 60)
            
        }
        
        startLvl1.isHidden = false
        stopLvl1.isHidden = true
        
        resetLvl1.isEnabled = false
        
        if (Highscore123 < 50){
            NextBtn.isHidden = false
            NextBtn.isEnabled = true
            
     
        } else {
            NextBtn.isHidden = true
            NextBtn.isEnabled = false
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
        // Dispose of any resources that can be recreated.
    }
    
    func createAlert (title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Continue to Game", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
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
