//
//  ViewController.swift
//  TikToc
//
//  Created by Abhi Jani on 7/16/18.
//  Copyright © 2018 Abhi Jani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var generalModeBtn: UIButton!
    
    
    
    @IBOutlet weak var journeyModeBtn: UIButton!
    
    @IBOutlet weak var multiplayer: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generalModeBtn.layer.cornerRadius = 8
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.generalModeBtn.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.generalModeBtn.transform = CGAffineTransform.identity
                        }
        })
//        generalModeBtn.layer.animation = "shake"
        
        generalModeBtn.layer.cornerRadius = 8
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.journeyModeBtn.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.journeyModeBtn.transform = CGAffineTransform.identity
                        }
        })
        //        generalModeBtn.layer.animation = "shake"
        
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.multiplayer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.multiplayer.transform = CGAffineTransform.identity
                        }
        })
    }
    
                    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

