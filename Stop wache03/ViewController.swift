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
    
    @IBOutlet weak var playBtn: UIBarButtonItem!
    @IBOutlet weak var pauseBtn: UIBarButtonItem!
    @IBOutlet weak var stopBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLbl.text = "00:00:00"
    }

    @IBAction func playBtn(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        timer_running = true
        
        changeButtonState(play: false, pause: true, stop: true)
        
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        myTimer.invalidate()
        
        changeButtonState(play: true , pause: false, stop: true)
        
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        timeLbl.text = "00:00:00"
        
        changeButtonState(play: true, pause: true, stop: false)
        
    }
    
    
    @objc func updateTimer(){
        count += 1
        let min = count / 6000
        let sec = count / 100 - (min*60)
        let msec = count % 100
        let output = String(format: "%02d:%02d:%02d", min, sec, msec)
        timeLbl.text = output
    }
    
    func changeButtonState(play: Bool, pause: Bool, stop: Bool){
        playBtn.isEnabled = play
        stopBtn.isEnabled = stop
        pauseBtn.isEnabled = pause
        
    }
}

