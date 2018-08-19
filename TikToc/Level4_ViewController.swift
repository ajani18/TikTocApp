//
//  Level4_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level4_ViewController: UIViewController {
    
    var timer4 = Timer()
    var Score45 = 0
    var Highscore4 = 100000
    

    @IBAction func TutorialAction4(_ sender: Any) {
        createAlert(title: "Level 4", message: "Hit Start. Stop. Reset. and get below 0.35 seconds")
    }
    
    
    @IBOutlet weak var ScoreLabelLvl4: UILabel!
    
    @IBOutlet weak var ResetLvl4: UIButton!
    
    @IBOutlet weak var StartLvl4: UIButton!
    
    @IBOutlet weak var StopLvl4: UIButton!
    
    @IBOutlet weak var HighScoreLblLvl4: UILabel!
    
    @IBOutlet weak var nextBtnLvl4: UIButton!
    
    @IBAction func StartActionLvl4(_ sender: Any) {
        timer4 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level4_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        StartLvl4.isHidden = true
        StopLvl4.isHidden = false
        
        ResetLvl4.isEnabled = false
        
    }
    
    @objc func updateCountdown() {
        Score45 += 1
        
        //Set counter in UILabel
        ScoreLabelLvl4.text! = String(format: "%02d:%02d.%02d", Score45 / 3600, (Score45 % 3600) / 60, (Score45 % 3600) % 60)
        
    }
    
    @IBAction func StopActionLvl4(_ sender: Any) {
        timer4.invalidate()
        
        if ((Highscore4 > Score45) && (Score45 != 0))  {
            Highscore4 = Score45
            HighScoreLblLvl4.text = String(format: "%02d:%02d.%02d", Highscore4 / 3600, (Highscore4 % 3600) / 60, (Highscore4 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore4, forKey: "Highscore456")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        StartLvl4.isHidden = false
        StopLvl4.isHidden = true
        
        ResetLvl4.isEnabled = true
        StartLvl4.isEnabled = false
        
        if (Highscore4 < 35){
            nextBtnLvl4.isHidden = false
            nextBtnLvl4.isEnabled = true
            
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
            nextBtnLvl4.isHidden = true
            nextBtnLvl4.isEnabled = false
        }
    }
    
    @IBAction func ResetActionLvl4(_ sender: Any) {
        Score45 = 0
        StopActionLvl4(sender)
        ScoreLabelLvl4.text! = String(format: "%02d:%02d.%02d", Score45 / 3600, (Score45 % 3600) / 60, (Score45 % 3600) % 60)
        
        StopLvl4.isHidden = true
        StartLvl4.isHidden = false
        
        ResetLvl4.isEnabled = false
        
        StartLvl4.isEnabled = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore456") != nil) {
            Highscore4 = HighscoreDefault.value(forKey: "Highscore456") as! Int
            HighScoreLblLvl4.text = String(format: "%02d:%02d.%02d", Highscore4 / 3600, (Highscore4 % 3600) / 60, (Highscore4 % 3600) % 60)
            
        }
        
        StartLvl4.isHidden = false
        StopLvl4.isHidden = true
        
        ResetLvl4.isEnabled = false
        
        if (Highscore4 < 35){
            nextBtnLvl4.isHidden = false
            nextBtnLvl4.isEnabled = true
            
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
            nextBtnLvl4.isHidden = true
            nextBtnLvl4.isEnabled = false
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
