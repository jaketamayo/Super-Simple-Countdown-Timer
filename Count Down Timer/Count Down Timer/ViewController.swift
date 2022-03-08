//
//  ViewController.swift
//  Count Down Timer
//
//  Created by Jacob Tamayo on 3/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        runTimer()
    }
    
    //This method call intinalizes the timer. It specifies the timerInterval(how often the method will be called and the selctor(the method being called).
    //The timeInterval is measured in seconds so we need to set it to 1(minutes).
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    var resumeTapped = false
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        let seconds = 60
        timerLabel.text = "\(seconds)"
    }
   
    @objc func updateTimer(){
        seconds -= 1 //this decrements the seconds
        timerLabel.text = "\(seconds)" //this will update the label
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
}

