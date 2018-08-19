//
//  Level6_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level6_ViewController: UIViewController {
    
    var timer6 = Timer()
    var Score6 = 0
    var Highscore6 = 10000

    @IBAction func Tutorial6(_ sender: Any) {
        createAlert(title: "Level 6", message: "This level is about accuracy, try to get between 0.30 & 0.40 seconds")
    }
    @IBOutlet weak var ScoreLblLvl6: UILabel!
    
    @IBOutlet weak var StartLvl6: UIButton!
    
    @IBOutlet weak var StopLvl6: UIButton!
    
    @IBOutlet weak var ResetLvl6: UIButton!
    
    @IBOutlet weak var HighScoreLbl: UILabel!
    
    @IBOutlet weak var nextBtnLvl6: UIButton!
    
    @IBAction func StopActionLevel6(_ sender: Any) {
        timer6.invalidate()
        
//        if ((Highscore6 > Score6) && (Score6 != 0))  {
//            Highscore6 = Score6
//            HighScoreLbl.text = String(format: "%02d:%02d:%02d", Highscore6 / 3600, (Highscore6 % 3600) / 60, (Highscore6 % 3600) % 60)
//            let HighscoreDefault = UserDefaults.standard
//            HighscoreDefault.set(Highscore6, forKey: "Highscore678")
//            HighscoreDefault.synchronize()
//        }
//        else {
//            print ("ok")
//        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        StartLvl6.isHidden = false
        StopLvl6.isHidden = true
        
        ResetLvl6.isEnabled = true
        StartLvl6.isEnabled = false
        
        if (Score6 > 30 && Score6 < 40){
            Highscore6 = Score6
            HighScoreLbl.text = String(format: "%02d:%02d.%02d", Highscore6 / 3600, (Highscore6 % 3600) / 100, (Highscore6 % 3600) % 100)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore6, forKey: "Highscore678")
            HighscoreDefault.synchronize()
            nextBtnLvl6.isHidden = false
            nextBtnLvl6.isEnabled = true

        } else {
            nextBtnLvl6.isHidden = true
            nextBtnLvl6.isEnabled = false
            
        }
        
        if (Highscore6 > 30 && Highscore6 < 40) {
            nextBtnLvl6.isHidden = false
            nextBtnLvl6.isEnabled = true
            
        } else {
            nextBtnLvl6.isHidden = true
            nextBtnLvl6.isEnabled = false
            
        }
    }
    @IBAction func ResetActionLvl6(_ sender: Any) {
        Score6 = 0
        StopActionLevel6(sender)
        ScoreLblLvl6.text! = String(format: "%02d:%02d.%02d", Score6 / 3600, (Score6 % 3600) / 100, (Score6 % 3600) % 100)
        
        StopLvl6.isHidden = true
        StartLvl6.isHidden = false
        
        ResetLvl6.isEnabled = false
        
        StartLvl6.isEnabled = true
        
    }
    
    @IBAction func StartActionLvl6(_ sender: Any) {
        timer6 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level6_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        StartLvl6.isHidden = true
        StopLvl6.isHidden = false
        
        ResetLvl6.isEnabled = false
        
        if (Highscore6 > 30 && Highscore6 < 40) {
            nextBtnLvl6.isHidden = false
            nextBtnLvl6.isEnabled = true
            
        } else {
            nextBtnLvl6.isHidden = true
            nextBtnLvl6.isEnabled = false
            
        }
        
    }
    
    @objc func updateCountdown() {
        Score6 += 1
        
        //Set counter in UILabel
        ScoreLblLvl6.text! = String(format: "%02d:%02d.%02d", Score6 / 3600, (Score6 % 3600) / 100, (Score6 % 3600) % 100)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore678") != nil) {
            Highscore6 = HighscoreDefault.value(forKey: "Highscore678") as! Int
            HighScoreLbl.text = String(format: "%02d:%02d.%02d", Highscore6 / 3600, (Highscore6 % 3600) / 100, (Highscore6 % 3600) % 100)
            
        }
        
        StartLvl6.isHidden = false
        StopLvl6.isHidden = true
        
        ResetLvl6.isEnabled = false
        
        if (Highscore6 > 30 && Highscore6 < 40){
            nextBtnLvl6.isHidden = false
            nextBtnLvl6.isEnabled = true

        } else {
            nextBtnLvl6.isHidden = true
            nextBtnLvl6.isEnabled = false
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
