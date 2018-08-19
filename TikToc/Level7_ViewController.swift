//
//  Level7_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level7_ViewController: UIViewController {
    
    var timer7 = Timer()
    var Score7 = 0
    var Highscore7 = 10000
    
    @IBAction func Tutoiral7(_ sender: Any) {
        createAlert(title: "Level 7", message: "Hit Start. Stop. Reset. and get below 0.15 seconds")
    }
    
    
    @IBOutlet weak var ScoreLblLvl7: UILabel!
    
    @IBOutlet weak var StartLvl7: UIButton!
    
    @IBOutlet weak var StopLvl7: UIButton!
    
    @IBOutlet weak var ResetLvl7: UIButton!
    
    @IBOutlet weak var HighScoreLblLvl7: UILabel!
    
    @IBOutlet weak var nextBtnLvl7: UIButton!
    
    @IBAction func StartActionLvl7(_ sender: Any) {
        timer7 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level7_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        StartLvl7.isHidden = true
        StopLvl7.isHidden = false
        
        ResetLvl7.isEnabled = false
        
    }
    
    @objc func updateCountdown() {
        Score7 += 1
        
        //Set counter in UILabel
        ScoreLblLvl7.text! = String(format: "%02d:%02d.%02d", Score7 / 3600, (Score7 % 3600) / 100, (Score7 % 3600) % 100)
        
    }
    
    @IBAction func StopActionLvl7(_ sender: Any) {
        timer7.invalidate()
        
        if ((Highscore7 > Score7) && (Score7 != 0))  {
            Highscore7 = Score7
            HighScoreLblLvl7.text = String(format: "%02d:%02d.%02d", Highscore7 / 3600, (Highscore7 % 3600) / 100, (Highscore7 % 3600) % 100)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore7, forKey: "Highscore123489")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        StartLvl7.isHidden = false
        StopLvl7.isHidden = true
        
        ResetLvl7.isEnabled = true
        StartLvl7.isEnabled = false
        
        if (Highscore7 < 15){
            nextBtnLvl7.isHidden = false
            nextBtnLvl7.isEnabled = true
            
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
            nextBtnLvl7.isHidden = true
            nextBtnLvl7.isEnabled = false
        }
        
        
    }
    
    @IBAction func ResetActionLvl7(_ sender: Any) {
        Score7 = 0
        StopActionLvl7(sender)
        ScoreLblLvl7.text! = String(format: "%02d:%02d.%02d", Score7 / 3600, (Score7 % 3600) / 100, (Score7 % 3600) % 100)
        
        StopLvl7.isHidden = true
        StartLvl7.isHidden = false
        
        ResetLvl7.isEnabled = false
        
        StartLvl7.isEnabled = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore123489") != nil) {
            Highscore7 = HighscoreDefault.value(forKey: "Highscore123489") as! Int
            HighScoreLblLvl7.text = String(format: "%02d:%02d.%02d", Highscore7 / 3600, (Highscore7 % 3600) / 100, (Highscore7 % 3600) % 100)
            
        }
        
        StartLvl7.isHidden = false
        StopLvl7.isHidden = true
        
        ResetLvl7.isEnabled = false
        
        if (Highscore7 < 15){
            nextBtnLvl7.isHidden = false
            nextBtnLvl7.isEnabled = true
            
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
            nextBtnLvl7.isHidden = true
            nextBtnLvl7.isEnabled = false
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
