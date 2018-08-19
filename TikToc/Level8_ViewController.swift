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
    var Highscore8 = 1000000
    
    
    @IBAction func Tutorial8(_ sender: Any) {
        createAlert(title: "Level 8", message: "The stop button will appear randomly and get a time below 0.4 seconds.")

    }
    
    @IBOutlet weak var home9: UIButton!
    
    @IBOutlet weak var tut8: UIButton!
    
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
        
        let buttonWidth = StopLvl8.frame.width
        let buttonHeight = StopLvl8.frame.height
        
        let viewWidth = StopLvl8.superview!.bounds.width
        let viewHeight = StopLvl8.superview!.bounds.width
        
        let xWidth = viewWidth - buttonWidth
        let yHeight = viewHeight - buttonHeight
        
        let xoffset = CGFloat(arc4random_uniform(UInt32(xWidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yHeight)))
        
        StopLvl8.center.x = xoffset + buttonWidth / 2
        StopLvl8.center.y = yoffset + buttonHeight / 2
        home9.isHidden = true
        
        tut8.isHidden = true
    }
    
    @objc func updateCountdown() {
        Score8 += 1
        
        //Set counter in UILabel
        ScoreLblLvl8.text! = String(format: "%02d:%02d.%02d", Score8 / 3600, (Score8 % 3600) / 60, (Score8 % 3600) % 60)
       
    }
    
    @IBAction func StopActionLvl8(_ sender: Any) {
        timer8.invalidate()
        
        if ((Highscore8 > Score8) && (Score8 != 0))  {
            Highscore8 = Score8
            HighScoreLbl8.text = String(format: "%02d:%02d.%02d", Highscore8 / 3600, (Highscore8 % 3600) / 60, (Highscore8 % 3600) % 60)
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
        
        if (Highscore8 < 40){
            nextBtn8.isHidden = false
            nextBtn8.isEnabled = true

        } else {
            nextBtn8.isHidden = true
            nextBtn8.isEnabled = false
        }
        
        home9.isHidden = false
        
        tut8.isHidden = false
        
    }
    
    @IBAction func ResetActionLvl8(_ sender: Any) {
        Score8 = 0
        StopActionLvl8(sender)
        ScoreLblLvl8.text! = String(format: "%02d:%02d.%02d", Score8 / 3600, (Score8 % 3600) / 60, (Score8 % 3600) % 60)
        
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
            HighScoreLbl8.text = String(format: "%02d:%02d.%02d", Highscore8 / 3600, (Highscore8 % 3600) / 60, (Highscore8 % 3600) % 60)
            
        }
        
        StartLvl8.isHidden = false
        StopLvl8.isHidden = true
        
        ResetLvl8.isEnabled = false
        
        if (Highscore8 < 40){
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
