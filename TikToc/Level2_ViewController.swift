//
//  Level2_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/25/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level2_ViewController: UIViewController {
    
    var timer = Timer()
    var Score = 0
    var Highscorelvl2 = 100000000000

    @IBOutlet weak var ScoreLabelLvl2: UILabel!
    
    @IBOutlet weak var HighScoreLvl2: UILabel!
    
    @IBOutlet weak var startLvl2: UIButton!
    
    @IBOutlet weak var stopLvl2: UIButton!
    
    @IBOutlet weak var resetLvl2: UIButton!
    
    @IBOutlet weak var nextBtnLvl2: UIButton!
    
    @IBAction func StartActionLvl2(_ sender: Any) {
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level2_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        startLvl2.isHidden = true
        stopLvl2.isHidden = false
        
        resetLvl2.isEnabled = false
        
        let buttonWidth = stopLvl2.frame.width
        let buttonHeight = stopLvl2.frame.height
        
        let viewWidth = stopLvl2.superview!.bounds.width
        let viewHeight = stopLvl2.superview!.bounds.width
        
        let xWidth = viewWidth - buttonWidth
        let yHeight = viewHeight - buttonHeight
        
        let xoffset = CGFloat(arc4random_uniform(UInt32(xWidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yHeight)))
        
        stopLvl2.center.x = xoffset + buttonWidth / 2
        stopLvl2.center.y = yoffset + buttonHeight / 2
        
    }
    
    @objc func updateCountdown() {
        Score += 1
        
        //Set counter in UILabel
        ScoreLabelLvl2.text! = String(format: "%02d:%02d:%02d", Score / 3600, (Score % 3600) / 60, (Score % 3600) % 60)
        
    }
    
    @IBAction func StopActionLvl2(_ sender: Any) {
        timer.invalidate()
        
        if ((Highscorelvl2 > Score) && (Score != 0))  {
            Highscorelvl2 = Score
            HighScoreLvl2.text = String(format: "%02d:%02d:%02d", Highscorelvl2 / 3600, (Highscorelvl2 % 3600) / 60, (Highscorelvl2 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscorelvl2, forKey: "Highscorelvl2")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        startLvl2.isHidden = false
        stopLvl2.isHidden = true
        
        resetLvl2.isEnabled = true
        startLvl2.isEnabled = false
        
        if (Highscorelvl2 < 50){
            nextBtnLvl2.isHidden = false
            nextBtnLvl2.isEnabled = true
        } else {
            nextBtnLvl2.isHidden = true
            nextBtnLvl2.isEnabled = false
        }
        
    }
    
    @IBAction func ResetActionLvl2(_ sender: Any) {
        Score = 0
        StopActionLvl2(sender)
        ScoreLabelLvl2.text! = String(format: "%02d:%02d:%02d", Score / 3600, (Score % 3600) / 60, (Score % 3600) % 60)
        
        stopLvl2.isHidden = true
        startLvl2.isHidden = false
        
        resetLvl2.isEnabled = false
        
        startLvl2.isEnabled = true
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscorelvl2") != nil) {
            Highscorelvl2 = HighscoreDefault.value(forKey: "Highscorelvl2") as! Int
            HighScoreLvl2.text = String(format: "%02d:%02d:%02d", Highscorelvl2 / 3600, (Highscorelvl2 % 3600) / 60, (Highscorelvl2 % 3600) % 60)
            
        }
        
        startLvl2.isHidden = false
        stopLvl2.isHidden = true
        
        resetLvl2.isEnabled = false
        
        if (Highscorelvl2 < 50){
            nextBtnLvl2.isHidden = false
            nextBtnLvl2.isEnabled = true
        } else {
            nextBtnLvl2.isHidden = true
            nextBtnLvl2.isEnabled = false
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
