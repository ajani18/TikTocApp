//
//  GeneralModeViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/16/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class GeneralModeViewController: UIViewController {
    
    var timer = Timer()
    var Score = 0
    var Highscore1 = 10000

    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var ScoreLbl: UILabel!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var HighscoreLbl: UILabel!
    
    @IBOutlet weak var stop: UIButton!
    
    //Weak Vars
    
    @IBAction func StartAction(_ sender: Any) {
        //Schedule a timer
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GeneralModeViewController.updateCountdown), userInfo: nil, repeats: true)
        
        start.isHidden = true
        stop.isHidden = false
        
        resetBtn.isEnabled = false
        
    }
    
     @objc func updateCountdown() {
        Score += 1
        
        //Set counter in UILabel
        ScoreLbl.text! = String(format: "%02d:%02d.%02d", Score / 3600, (Score % 3600) / 100, (Score % 3600) % 100)
        
    }
    
    @IBAction func StopAction(_ sender: Any) {
        //Invalidate timer
        timer.invalidate()
        
        if ((Highscore1 > Score) && (Score != 0))  {
            Highscore1 = Score
            HighscoreLbl.text = String(format: "%02d:%02d.%02d", Highscore1 / 3600, (Highscore1 % 3600) / 100, (Highscore1 % 3600) % 100)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore1, forKey: "Highscore3")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        start.isHidden = false
        stop.isHidden = true
        
        resetBtn.isEnabled = true
        start.isEnabled = false

    }
    
    @IBAction func RestAction(_ sender: Any) {
        Score = 0
        StopAction(sender)
        ScoreLbl.text! = String(format: "%02d:%02d.%02d", Score / 3600, (Score % 3600) / 100, (Score % 3600) % 100)
        
        stop.isHidden = true
        start.isHidden = false
        
        resetBtn.isEnabled = false
        
        start.isEnabled = true 
        
    }
    
    // IB Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore3") != nil) {
            Highscore1 = HighscoreDefault.value(forKey: "Highscore3") as! Int
            HighscoreLbl.text = String(format: "%02d:%02d.%02d", Highscore1 / 3600, (Highscore1 % 3600) / 100, (Highscore1 % 3600) % 100)
            
        }
        
        start.isHidden = false
        stop.isHidden = true
        
        resetBtn.isEnabled = false
        
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
