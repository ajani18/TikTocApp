//
//  Level4New_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 8/19/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level4New_ViewController: UIViewController {
    
    var timer4n = Timer()
    var Score4n = 0
    var Highscore4n = 1000
    
    @IBAction func tut4n(_ sender: Any) {
        createAlert(title: "Level 4", message: "This level is about precision, get exactly 1 second")
    }

    @IBOutlet weak var highScoreLbl4n: UILabel!
    
    @IBOutlet weak var scoreLabel4N: UILabel!
    
    @IBOutlet weak var start4n: UIButton!
    
    @IBOutlet weak var stop4n: UIButton!
    
    @IBOutlet weak var next4n: UIButton!
    
    @IBOutlet weak var reset4n: UIButton!
    
    @IBOutlet weak var startAction4n: UIButton!
    
    @IBAction func starrAction4n(_ sender: Any) {
        timer4n = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level4New_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        start4n.isHidden = true
        stop4n.isHidden = false
        
        reset4n.isEnabled = false
        
        if (Highscore4n == 100) {
            next4n.isHidden = false
            next4n.isEnabled = true
        } else {
            next4n.isHidden = true
            next4n.isEnabled = false
        }
        
        
    }
    
    @objc func updateCountdown() {
        Score4n += 1
        
        //Set counter in UILabel
        scoreLabel4N.text! = String(format: "%02d:%02d.%02d", Score4n / 3600, (Score4n % 3600) / 100, (Score4n % 3600) % 100)
        
    }
    
    @IBAction func stopAction4n(_ sender: Any) {
        timer4n.invalidate()
        
        start4n.isHidden = false
        stop4n.isHidden = true
        
        reset4n.isEnabled = true
        start4n.isEnabled = false
        
        if (Score4n == 100){
            Highscore4n = Score4n
            highScoreLbl4n.text = String(format: "%02d:%02d.%02d", Highscore4n / 3600, (Highscore4n % 3600) / 100, (Highscore4n % 3600) % 100)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore4n, forKey: "Highscore4n")
            HighscoreDefault.synchronize()
            next4n.isHidden = false
            next4n.isEnabled = true
            
        } else {
            next4n.isHidden = true
            next4n.isEnabled = false
        }
        
        if (Highscore4n == 100) {
            next4n.isHidden = false
            next4n.isEnabled = true
        } else {
            next4n.isHidden = true
            next4n.isEnabled = false
        }

     
    }
    
    
    
    @IBAction func resetAction4n(_ sender: Any) {
        Score4n = 0
        stopAction4n(sender)
        scoreLabel4N.text! = String(format: "%02d:%02d.%02d", Score4n / 3600, (Score4n % 3600) / 100, (Score4n % 3600) % 100)
        
        stop4n.isHidden = true
        start4n.isHidden = false
        
        reset4n.isEnabled = false
        
        start4n.isEnabled = true
        //        start3.is
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore4n") != nil) {
            Highscore4n = HighscoreDefault.value(forKey: "Highscore4n") as! Int
            highScoreLbl4n.text = String(format: "%02d:%02d.%02d", Highscore4n / 3600, (Highscore4n % 3600) / 100, (Highscore4n % 3600) % 100)
            
        }
        
        start4n.isHidden = false
        stop4n.isHidden = true
        
        reset4n.isEnabled = false
        
        if (Highscore4n == 100){
            next4n.isHidden = false
            next4n.isEnabled = true
            
            
        } else {
            next4n.isHidden = true
            next4n.isEnabled = false
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
