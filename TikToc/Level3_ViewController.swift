//
//  Level3_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level3_ViewController: UIViewController {
    
    var timer3 = Timer()
    var Score345 = 0
    var Highscore13 = 100000000000
    
    @IBOutlet weak var ScoreLblLvl3: UILabel!
    
    @IBOutlet weak var startLvl3: UIButton!
    
    @IBOutlet weak var resetLvl3: UIButton!
    
    @IBOutlet weak var stopLvl3: UIButton!
    
    @IBOutlet weak var nextBtnLvl3: UIButton!
    
    @IBOutlet weak var HighScoreLvl3: UILabel!
    
    @IBAction func StartActionLvl3(_ sender: Any) {
        timer3 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level3_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        startLvl3.isHidden = true
        stopLvl3.isHidden = false
        
        resetLvl3.isEnabled = false
    }
    
    @objc func updateCountdown() {
        Score345 += 1
        
        //Set counter in UILabel
        ScoreLblLvl3.text! = String(format: "%02d:%02d:%02d", Score345 / 3600, (Score345 % 3600) / 60, (Score345 % 3600) % 60)
        
    }
    
    @IBAction func ResetActionLvl3(_ sender: Any) {
        Score345 = 0
        StopActionLvl3(sender)
        ScoreLblLvl3.text! = String(format: "%02d:%02d:%02d", Score345 / 3600, (Score345 % 3600) / 60, (Score345 % 3600) % 60)
        
        stopLvl3.isHidden = true
        startLvl3.isHidden = false
        
        resetLvl3.isEnabled = false
        
        startLvl3.isEnabled = true
    }
    
    @IBAction func StopActionLvl3(_ sender: Any) {
        timer3.invalidate()
        
        if ((Highscore13 > Score345) && (Score345 != 0))  {
            Highscore13 = Score345
            HighScoreLvl3.text = String(format: "%02d:%02d:%02d", Highscore13 / 3600, (Highscore13 % 3600) / 60, (Highscore13 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore13, forKey: "Highscore1233456")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        startLvl3.isHidden = false
        stopLvl3.isHidden = true
        
        resetLvl3.isEnabled = true
        startLvl3.isEnabled = false
        
        if (Highscore13 < 50){
            nextBtnLvl3.isHidden = false
            nextBtnLvl3.isEnabled = true
            
            //            NextBtn.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            //
            //            UIView.animate(withDuration: 2.0,
            //                           delay: 0,
            //                           usingSpringWithDamping: 0.2,
            //                           initialSpringVelocity: 6.0,
            //                           options: .allowUserInteraction,
            //                           animations: { [weak self] in
            //                            self?.NextBtn.transform = .identity
            //                },
            //                           completion: nil)
        } else {
            nextBtnLvl3.isHidden = true
            nextBtnLvl3.isEnabled = false
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore1233456") != nil) {
            Highscore13 = HighscoreDefault.value(forKey: "Highscore1233456") as! Int
            HighScoreLvl3.text = String(format: "%02d:%02d:%02d", Highscore13 / 3600, (Highscore13 % 3600) / 60, (Highscore13 % 3600) % 60)
            
            startLvl3.isHidden = false
            stopLvl3.isHidden = true
            
            resetLvl3.isEnabled = false
            
            if (Highscore13 < 50){
                nextBtnLvl3.isHidden = false
                nextBtnLvl3.isEnabled = true
                
                //            NextBtn.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                //
                //            UIView.animate(withDuration: 2.0,
                //                           delay: 0,
                //                           usingSpringWithDamping: 0.2,
                //                           initialSpringVelocity: 6.0,
                //                           options: .allowUserInteraction,
                //                           animations: { [weak self] in
                //                            self?.NextBtn.transform = .identity
                //                },
                //                           completion: nil)
            } else {
                nextBtnLvl3.isHidden = true
                nextBtnLvl3.isEnabled = false
            }

            
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
