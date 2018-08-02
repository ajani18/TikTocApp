//
//  Level3_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/31/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level3_ViewController: UIViewController {
    
    var timer3 = Timer()
    var Score3 = 0
    var Highscore3 = 100000000000
    
    
    @IBAction func TutorialAction3(_ sender: Any) {
        
        createAlert(title: "Level 3", message: "This level is about accuracy, try to get between 0.4 & 0.6 seconds")
    }
    
    @IBOutlet weak var HighScoreLbl3: UILabel!
    
    @IBOutlet weak var ScoreLbl3: UILabel!
    
    @IBOutlet weak var start3: UIButton!
    
    @IBOutlet weak var nextBtn3: UIButton!
    
    @IBOutlet weak var stop3: UIButton!
    
    @IBOutlet weak var reset3: UIButton!
    
    @IBAction func ResetAction3(_ sender: Any) {
        Score3 = 0
        StopAction3(sender)
        ScoreLbl3.text! = String(format: "%02d:%02d.%02d", Score3 / 3600, (Score3 % 3600) / 60, (Score3 % 3600) % 60)
        
        stop3.isHidden = true
        start3.isHidden = false
        
        reset3.isEnabled = false
        
        start3.isEnabled = true
//        start3.is
        
    }
    @IBAction func StopAction3(_ sender: Any) {
        timer3.invalidate()
        
//        if ((Highscore3 > Score3) && (Score3 != 0))  {
//            Highscore3 = Score3
//            HighScoreLbl3.text = String(format: "%02d:%02d:%02d", Highscore3 / 3600, (Highscore3 % 3600) / 60, (Highscore3 % 3600) % 60)
//            let HighscoreDefault = UserDefaults.standard
//            HighscoreDefault.set(Highscore3, forKey: "Highscore123123")
//            HighscoreDefault.synchronize()
//        }
//        else {
//            print ("ok")
//        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        start3.isHidden = false
        stop3.isHidden = true
        
        reset3.isEnabled = true
        start3.isEnabled = false
        
        if (Score3 > 40 && Score3 < 60){
            Highscore3 = Score3
            HighScoreLbl3.text = String(format: "%02d:%02d.%02d", Highscore3 / 3600, (Highscore3 % 3600) / 60, (Highscore3 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore3, forKey: "Highscore123123")
            HighscoreDefault.synchronize()
            nextBtn3.isHidden = false
            nextBtn3.isEnabled = true
            
        } else {
            nextBtn3.isHidden = true
            nextBtn3.isEnabled = false
        }
        
    }
    
    @IBAction func StartAction3(_ sender: Any) {
        timer3 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level3_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        start3.isHidden = true
        stop3.isHidden = false
        
        reset3.isEnabled = false
    }
    
    @objc func updateCountdown() {
        Score3 += 1
        
        //Set counter in UILabel
        ScoreLbl3.text! = String(format: "%02d:%02d.%02d", Score3 / 3600, (Score3 % 3600) / 60, (Score3 % 3600) % 60)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore123123") != nil) {
            Highscore3 = HighscoreDefault.value(forKey: "Highscore123123") as! Int
            HighScoreLbl3.text = String(format: "%02d:%02d.%02d", Highscore3 / 3600, (Highscore3 % 3600) / 60, (Highscore3 % 3600) % 60)
            
        }
        
        start3.isHidden = false
        stop3.isHidden = true
        
        reset3.isEnabled = false
        
        if (Highscore3 > 40 && Highscore3 < 60){
            nextBtn3.isHidden = false
            nextBtn3.isEnabled = true
            
            
        } else {
            nextBtn3.isHidden = true
            nextBtn3.isEnabled = false
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
