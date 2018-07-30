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
    var Highscore6 = 100000000000

    @IBOutlet weak var ScoreLblLvl6: UILabel!
    
    @IBOutlet weak var StartLvl6: UIButton!
    
    @IBOutlet weak var StopLvl6: UIButton!
    
    @IBOutlet weak var ResetLvl6: UIButton!
    
    @IBOutlet weak var HighScoreLbl: UILabel!
    
    @IBOutlet weak var nextBtnLvl6: UIButton!
    
    @IBAction func StopActionLevel6(_ sender: Any) {
        timer6.invalidate()
        
        if ((Highscore6 > Score6) && (Score6 != 0))  {
            Highscore6 = Score6
            HighScoreLbl.text = String(format: "%02d:%02d:%02d", Highscore6 / 3600, (Highscore6 % 3600) / 60, (Highscore6 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore6, forKey: "Highscore678")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        StartLvl6.isHidden = false
        StopLvl6.isHidden = true
        
        ResetLvl6.isEnabled = true
        StartLvl6.isEnabled = false
        
        if (Highscore6 < 50){
            nextBtnLvl6.isHidden = false
            nextBtnLvl6.isEnabled = true
            
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
            nextBtnLvl6.isHidden = true
            nextBtnLvl6.isEnabled = false
            
        }
    }
    @IBAction func ResetActionLvl6(_ sender: Any) {
        Score6 = 0
        StopActionLevel6(sender)
        ScoreLblLvl6.text! = String(format: "%02d:%02d:%02d", Score6 / 3600, (Score6 % 3600) / 60, (Score6 % 3600) % 60)
        
        StopLvl6.isHidden = true
        StopLvl6.isHidden = false
        
        ResetLvl6.isEnabled = false
        
        StartLvl6.isEnabled = true
        
    }
    
    @IBAction func StartActionLvl6(_ sender: Any) {
        timer6 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level6_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        StartLvl6.isHidden = true
        StopLvl6.isHidden = false
        
        ResetLvl6.isEnabled = false
    }
    
    @objc func updateCountdown() {
        Score6 += 1
        
        //Set counter in UILabel
        ScoreLblLvl6.text! = String(format: "%02d:%02d:%02d", Score6 / 3600, (Score6 % 3600) / 60, (Score6 % 3600) % 60)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore678") != nil) {
            Highscore6 = HighscoreDefault.value(forKey: "Highscore678") as! Int
            HighScoreLbl.text = String(format: "%02d:%02d:%02d", Highscore6 / 3600, (Highscore6 % 3600) / 60, (Highscore6 % 3600) % 60)
            
        }
        
        StartLvl6.isHidden = false
        StopLvl6.isHidden = true
        
        ResetLvl6.isEnabled = false
        
        if (Highscore6 < 50){
            nextBtnLvl6.isHidden = false
            nextBtnLvl6.isEnabled = true
            
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
            nextBtnLvl6.isHidden = true
            nextBtnLvl6.isEnabled = false
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
