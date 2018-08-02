//
//  Level9_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level9_ViewController: UIViewController {
    
    var timer9 = Timer()
    var Score9 = 0
    var Highscore9 = 100000000000
    
    
    @IBAction func Tutorial9(_ sender: Any) {
        createAlert(title: "Level 9", message: "This level is about accuracy, try to get between 0 & 0.08 seconds")
    }
    
    @IBOutlet weak var Start9: UIButton!
    
    @IBOutlet weak var ScoreLbl9: UILabel!
    
    @IBOutlet weak var Stop9: UIButton!
    
    @IBOutlet weak var Reset9: UIButton!
    
    @IBOutlet weak var HighScore9: UILabel!
    
    @IBOutlet weak var Next9: UIButton!
    
    @IBAction func StartAction9(_ sender: Any) {
        timer9 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level9_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        Start9.isHidden = true
        Stop9.isHidden = false
        
        Reset9.isEnabled = false
        
    }
    
    @objc func updateCountdown() {
        Score9 += 1
        
        //Set counter in UILabel
        ScoreLbl9.text! = String(format: "%02d:%02d.%02d", Score9 / 3600, (Score9 % 3600) / 60, (Score9 % 3600) % 60)
        
    }
    
    @IBAction func ResetAction9(_ sender: Any) {
        Score9 = 0
        StopAction9(sender)
        ScoreLbl9.text! = String(format: "%02d:%02d.%02d", Score9 / 3600, (Score9 % 3600) / 60, (Score9 % 3600) % 60)
        
        Stop9.isHidden = true
        Start9.isHidden = false
        
        Reset9.isEnabled = false
        
        Start9.isEnabled = true
 
        
    }
    
    @IBAction func StopAction9(_ sender: Any) {
        timer9.invalidate()
        
//        if ((Highscore9 > Score9) && (Score9 != 0))  {
//            Highscore9 = Score9
//            HighScore9.text = String(format: "%02d:%02d:%02d", Highscore9 / 3600, (Highscore9 % 3600) / 60, (Highscore9 % 3600) % 60)
//            let HighscoreDefault = UserDefaults.standard
//            HighscoreDefault.set(Highscore9, forKey: "Highscore129")
//            HighscoreDefault.synchronize()
//        }
//        else {
//            print ("ok")
//        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        Start9.isHidden = false
        Stop9.isHidden = true
        
        Reset9.isEnabled = true
        Start9.isEnabled = false
        
        if (Score9 > 0 && Score9 < 8){
            Highscore9 = Score9
            HighScore9.text = String(format: "%02d:%02d.%02d", Highscore9 / 3600, (Highscore9 % 3600) / 60, (Highscore9 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore9, forKey: "Highscore129")
            HighscoreDefault.synchronize()
            Next9.isHidden = false
            Next9.isEnabled = true
            
        } else {
            Next9.isHidden = true
            Next9.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore129") != nil) {
            Highscore9 = HighscoreDefault.value(forKey: "Highscore129") as! Int
            HighScore9.text = String(format: "%02d:%02d.%02d", Highscore9 / 3600, (Highscore9 % 3600) / 60, (Highscore9 % 3600) % 60)
            
        }
        
        Start9.isHidden = false
        Stop9.isHidden = true
        
        Reset9.isEnabled = false
        
        if (Highscore9 > 0 && Highscore9 < 8){
            Next9.isHidden = false
            Next9.isEnabled = true
            
            
        } else {
            Next9.isHidden = true
            Next9.isEnabled = false
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
