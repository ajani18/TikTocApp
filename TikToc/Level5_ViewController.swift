//
//  Level5_ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/30/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class Level5_ViewController: UIViewController {
    
    var timer5 = Timer()
    var Score123 = 0
    var Highscore12356 = 100000000000

    @IBOutlet weak var ScoreLblLvl5: UILabel!
    
    @IBOutlet weak var StartLblLvl4: UIButton!
    
    @IBOutlet weak var StopLvl5: UIButton!
    
    @IBOutlet weak var ResetLvl5: UIButton!
    
    @IBOutlet weak var nextBtnLvl5: UIButton!
    
    @IBOutlet weak var HighScoreLblLvl5: UILabel!
    
    @IBAction func StartActionlvl5(_ sender: Any) {
        timer5 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Level5_ViewController.updateCountdown), userInfo: nil, repeats: true)
        
        StartLblLvl4.isHidden = true
        StopLvl5.isHidden = false
        
        ResetLvl5.isEnabled = false
        
        let buttonWidth = StopLvl5.frame.width
        let buttonHeight = StopLvl5.frame.height
        
        let viewWidth = StopLvl5.superview!.bounds.width
        let viewHeight = StopLvl5.superview!.bounds.width
        
        let xWidth = viewWidth - buttonWidth
        let yHeight = viewHeight - buttonHeight
        
        let xoffset = CGFloat(arc4random_uniform(UInt32(xWidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yHeight)))
        
        StopLvl5.center.x = xoffset + buttonWidth / 2
        StopLvl5.center.y = yoffset + buttonHeight / 2

    }
    
    @objc func updateCountdown() {
        Score123 += 1
        
        //Set counter in UILabel
        ScoreLblLvl5.text! = String(format: "%02d:%02d:%02d", Score123 / 3600, (Score123 % 3600) / 60, (Score123 % 3600) % 60)
        
    }
    
    @IBAction func ResetActionLvl5(_ sender: Any) {
        Score123 = 0
        StopActionLvl5(sender)
        ScoreLblLvl5.text! = String(format: "%02d:%02d:%02d", Score123 / 3600, (Score123 % 3600) / 60, (Score123 % 3600) % 60)
        
        StopLvl5.isHidden = true
        StartLblLvl4.isHidden = false
        
        ResetLvl5.isEnabled = false
        
        StartLblLvl4.isEnabled = true
    }
    
    
    @IBAction func StopActionLvl5(_ sender: Any) {
        timer5.invalidate()
        
        if ((Highscore12356 > Score123) && (Score123 != 0))  {
            Highscore12356 = Score123
            HighScoreLblLvl5.text = String(format: "%02d:%02d:%02d", Highscore12356 / 3600, (Highscore12356 % 3600) / 60, (Highscore12356 % 3600) % 60)
            let HighscoreDefault = UserDefaults.standard
            HighscoreDefault.set(Highscore12356, forKey: "Highscore123456")
            HighscoreDefault.synchronize()
        }
        else {
            print ("ok")
        }
        
        //        let HighScore123 = Double(Highscore123)
        
        
        StartLblLvl4.isHidden = false
        StopLvl5.isHidden = true
        
        ResetLvl5.isEnabled = true
        StartLblLvl4.isEnabled = false
        
        if (Highscore12356 < 90){
            nextBtnLvl5.isHidden = false
            nextBtnLvl5.isEnabled = true
            
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
            nextBtnLvl5.isHidden = true
            nextBtnLvl5.isEnabled = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HighscoreDefault = UserDefaults.standard
        if (HighscoreDefault.value(forKey: "Highscore123456") != nil) {
            Highscore12356 = HighscoreDefault.value(forKey: "Highscore123456") as! Int
            HighScoreLblLvl5.text = String(format: "%02d:%02d:%02d", Highscore12356 / 3600, (Highscore12356 % 3600) / 60, (Highscore12356 % 3600) % 60)
            
        }
        
        StartLblLvl4.isHidden = false
        StopLvl5.isHidden = true
        
        ResetLvl5.isEnabled = false
        
        if (Highscore12356 < 90){
            nextBtnLvl5.isHidden = false
            nextBtnLvl5.isEnabled = true
            
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
            nextBtnLvl5.isHidden = true
            nextBtnLvl5.isEnabled = false
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
