//
//  ViewController.swift
//  Watch
//
//  Created by Amber Bullough on 9/2/18.
//  Copyright © 2018 Amber Bullough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0.0
    var timer = Timer()
    var aTimer: Timer!
    let defaultTimeInterval = 1.4
    var adjustedCounter = 0.0
    
    
    var isPlaying = false
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    @IBAction func startTimer(_ sender: Any)
    {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        stopButton.isEnabled = true
    
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopTimer(_ sender: Any)
    {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
    
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        timeLabel.text = String(counter)
    
    }

    
    override func viewDidLoad()
    {
       super.viewDidLoad()
        
        
        let timer = Timer()
        let counter = 0
        timeLabel.text = String(counter)
         aTimer = Timer.scheduledTimer(timeInterval: defaultTimeInterval, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }


  
    @objc func updateCounter() {
        counter += defaultTimeInterval
        adjustedCounter += 1
        let displayText = "\(adjustedCounter)"
        timeLabel.text = displayText
        print(displayText)
    }
}

