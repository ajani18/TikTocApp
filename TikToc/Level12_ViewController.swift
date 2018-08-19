//
//  Level12_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 8/19/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level12_ViewController: UIViewController {
    
    var timer12 = Timer()
    var Score12 = 0
    var Highscore12 = 1000
    
    @IBOutlet weak var scoreLbl12: UILabel!
    
    @IBOutlet weak var start12: UIButton!
    @IBOutlet weak var stop12: UIButton!
    @IBOutlet weak var next12: UIButton!
    @IBOutlet weak var highScore12: UILabel!
    @IBOutlet weak var reset12: UIButton!
    
    @IBAction func stop12(_ sender: Any) {
        timer12.invalidate()
        
        start12.isHidden = false
        stop12.isHidden = true
        
        reset12.isEnabled = true
        start12.isEnabled = false
        
        if (Score12 == 25){
            Highscore12 = Score12
            highScore12.text = String(format: "%02d:%02d.%02d", Highscore12 / 3600, (Highscore12 % 3600) / 100, (Highscore12 % 3600) % 100)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore12, forKey: "Highscore12")
            HighscoreDefault.synchronize()
            next12.isHidden = false
            next12.isEnabled = true
            
        } else {
            next12.isHidden = true
            next12.isEnabled = false
        }
        
        if (Highscore12 == 25) {
            next12.isHidden = false
            next12.isEnabled = true
        } else {
            next12.isHidden = true
            next12.isEnabled = false
        }
    }
    
    @IBAction func startAction12(_ sender: Any) {
        timer12 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level12_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        start12.isHidden = true
        stop12.isHidden = false
        
        reset12.isEnabled = false
        
        if (Highscore12 == 25) {
            next12.isHidden = false
            next12.isEnabled = true
        } else {
            next12.isHidden = true
            next12.isEnabled = false
        }
        
    }
    
    @objc func updateCountdown() {
        Score12 += 1
        
        //Set counter in UILabel
        scoreLbl12.text! = String(format: "%02d:%02d.%02d", Score12 / 3600, (Score12 % 3600) / 100, (Score12 % 3600) % 100)
        
    }
    
    @IBAction func ResetAction12(_ sender: Any) {
        Score12 = 0
        stop12(sender)
        scoreLbl12.text! = String(format: "%02d:%02d.%02d", Score12 / 3600, (Score12 % 3600) / 100, (Score12 % 3600) % 100)
        
        stop12.isHidden = true
        start12.isHidden = false
        
        reset12.isEnabled = false
        
        start12.isEnabled = true
        //        start3.is
    }
    
    @IBAction func Tutorial12(_ sender: Any) {
        createAlert(title: "Level 12", message: "This level is about precision, get exactly 0.25 seconds")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore12") != nil) {
            Highscore12 = HighscoreDefault.value(forKey: "Highscore12") as! Int
            highScore12.text = String(format: "%02d:%02d.%02d", Highscore12 / 3600, (Highscore12 % 3600) / 100, (Highscore12 % 3600) % 100)
            
        }
        
        start12.isHidden = false
        stop12.isHidden = true
        
        reset12.isEnabled = false
        
        if (Highscore12 == 25){
            next12.isHidden = false
            next12.isEnabled = true
            
            
        } else {
            next12.isHidden = true
            next12.isEnabled = false
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
