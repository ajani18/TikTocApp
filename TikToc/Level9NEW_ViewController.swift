//
//  Level9NEW_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 8/19/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level9NEW_ViewController: UIViewController {
    
    var timer8n = Timer()
    var Score8n = 0
    var Highscore8n = 1000

    @IBOutlet weak var highScore9n: UILabel!
    
    @IBOutlet weak var scoreLabel9: UILabel!
    
    @IBOutlet weak var next9n: UIButton!
    
    @IBOutlet weak var stop8: UIButton!
    
    @IBOutlet weak var start8: UIButton!
    
    @IBOutlet weak var reset8: UIButton!
    
    @IBAction func StartAction8(_ sender: Any) {
        timer8n = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level9NEW_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        start8.isHidden = true
        stop8.isHidden = false
        
        reset8.isEnabled = false
        
        if (Highscore8n == 50) {
            next9n.isHidden = false
            next9n.isEnabled = true
        } else {
            next9n.isHidden = true
            next9n.isEnabled = false
        }
        
    }
    
    @objc func updateCountdown() {
        Score8n += 1
        
        //Set counter in UILabel
        scoreLabel9.text! = String(format: "%02d:%02d.%02d", Score8n / 3600, (Score8n % 3600) / 100, (Score8n % 3600) % 100)
        
    }
    
    @IBAction func ResetAction(_ sender: Any) {
        Score8n = 0
        StopAction(sender)
        scoreLabel9.text! = String(format: "%02d:%02d.%02d", Score8n / 3600, (Score8n % 3600) / 100, (Score8n % 3600) % 100)
        
        stop8.isHidden = true
        start8.isHidden = false
        
        reset8.isEnabled = false
        
        start8.isEnabled = true
        //        start3.is
    }
    @IBAction func StopAction(_ sender: Any) {
        timer8n.invalidate()
        
        start8.isHidden = false
        stop8.isHidden = true
        
        reset8.isEnabled = true
        start8.isEnabled = false
        
        if (Score8n == 50){
            Highscore8n = Score8n
            highScore9n.text = String(format: "%02d:%02d.%02d", Highscore8n / 3600, (Highscore8n % 3600) / 100, (Highscore8n % 3600) % 100)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore8n, forKey: "Highscore8n")
            HighscoreDefault.synchronize()
            next9n.isHidden = false
            next9n.isEnabled = true
            
        } else {
            next9n.isHidden = true
            next9n.isEnabled = false
        }
        
        if (Highscore8n == 50) {
            next9n.isHidden = false
            next9n.isEnabled = true
        } else {
            next9n.isHidden = true
            next9n.isEnabled = false
        }
    }
    
    @IBAction func TutorialAction9(_ sender: Any) {
        createAlert(title: "Level 8", message: "This level is about precision, get exactly 0.5 seconds")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore8n") != nil) {
            Highscore8n = HighscoreDefault.value(forKey: "Highscore8n") as! Int
            highScore9n.text = String(format: "%02d:%02d.%02d", Highscore8n / 3600, (Highscore8n % 3600) / 100, (Highscore8n % 3600) % 100)
            
        }
        
        start8.isHidden = false
        stop8.isHidden = true
        
        reset8.isEnabled = false
        
        if (Highscore8n == 100){
            next9n.isHidden = false
            next9n.isEnabled = true
            
            
        } else {
            next9n.isHidden = true
            next9n.isEnabled = false
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
