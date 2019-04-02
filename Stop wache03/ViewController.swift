//
//  ViewController.swift
//  Stop wache03
//
//  Created by D7703_07 on 2019. 4. 2..
//  Copyright © 2019년 1234. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLbl: UILabel!
    
    var count = 0
    var myTimer = Timer()
    var timer_running = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLbl.text = String(count)
    }

    @IBAction func playBtn(_ sender: UIBarButtonItem) {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        timer_running = true
        
    }
    
    @IBAction func pauseBtn(_ sender: UIBarButtonItem) {
        myTimer.invalidate()
        
    }
    
    @IBAction func stopBtn(_ sender: UIBarButtonItem) {
        myTimer.invalidate()
        count = 0
        timeLbl.text = String(count)
    }
    
    @objc func updateTimer(){
        count += 1
        timeLbl.text = String(count)
    }
}

