//
//  ViewController.swift
//  AmirFarhadSina
//
//  Created by Amir Ardalan on 8/6/18.
//  Copyright © 2018 amir. All rights reserved.
//

import UIKit
import AACountDowner
class ViewController: UIViewController {

    
    @IBOutlet weak var aaVC: AACountDowner!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        aaVC.config(days: 0, hour: 1, minute: 2, second: 3)
        aaVC.Visiblity(forDay: false, hour: false, minute: true, seconds: true)
        aaVC.uiOption(haveShadow: false, background: UIColor.yellow, radius: 0)
        aaVC.Titles(forDay: "DAy", hour: "Hour", minute: "Minute", seconds: "Seconds")
        aaVC.font = UIFont(name: "Verdana", size: 12)
        aaVC.isTitleVisible = false
        aaVC.elementSpacing = 0
        aaVC.hasDotDivider = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

