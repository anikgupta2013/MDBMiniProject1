//
//  QuestionsViewController.swift
//  MDB Mini Project 1
//
//  Created by Anik Gupta on 9/11/19.
//  Copyright © 2019 Anik Gupta. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    // Score and current picture variables
    var currentName: String!
    var score = 0
    var longestRun = 0
    var currentRun = 0
    var nameSelected: UIButton!
    var lastAnswers = [String]()
    var lastRealAnswers = [String]()

    
    // Connect to UI elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name0: UIButton!
    @IBOutlet weak var name1: UIButton!
    @IBOutlet weak var name2: UIButton!
    @IBOutlet weak var name3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    let BORDER_RADIUS : CGFloat = 7
    let BLUE = UIColor(red: 0.07843137255, green: 0.5568627451, blue: 1, alpha: 1)
    let GREEN = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1)
    let RED = #colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1)
    // Timer
    let TIME_LIMIT = 5
    var seconds: Int! //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name0.layer.cornerRadius = BORDER_RADIUS
        name1.layer.cornerRadius = BORDER_RADIUS
        name2.layer.cornerRadius = BORDER_RADIUS
        name3.layer.cornerRadius = BORDER_RADIUS
        
        if currentName == nil {
            seconds = TIME_LIMIT
            update()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if currentName != nil {
            runTimer()
        }
    }
    
    func update() {
        resetTimer()
        nameSelected = nil
        currentName = Constants.names[Int.random(in: 0..<Constants.names.count)]
        imageView.image = Constants.getImageFor(name: currentName)
        var namesDisplayed = [String]()
        namesDisplayed.append(currentName)
        while namesDisplayed.count < 4 {
            let name = Constants.names[Int.random(in: 0..<Constants.names.count)]
            if (!namesDisplayed.contains(name)){
                namesDisplayed.append(name)
            }
        }
        namesDisplayed.shuffle()
        name0.setTitle(namesDisplayed[0], for:[])
        name1.setTitle(namesDisplayed[1], for:[])
        name2.setTitle(namesDisplayed[2], for:[])
        name3.setTitle(namesDisplayed[3], for:[])
        
    }

    @IBAction func name0Pressed(_ sender: Any) {
        namePressed(name0)
    }
    @IBAction func name1Pressed(_ sender: Any) {
        namePressed(name1)
    }
    @IBAction func name2Pressed(_ sender: Any) {
        namePressed(name2)
    }
    @IBAction func name3Pressed(_ sender: Any) {
        namePressed(name3)
    }
    
    func namePressed(_ name: UIButton){
        nameSelected = name
        seconds = -1
        name0.isEnabled = false
        name1.isEnabled = false
        name2.isEnabled = false
        name3.isEnabled = false
        //runTimer()
        addNameSelected(name: name.currentTitle!, realName: currentName)
        if name.currentTitle == currentName {
            score += 1
            currentRun += 1
            if currentRun > longestRun {
                longestRun = currentRun
            }
            name.backgroundColor = GREEN
        }
        else {
            currentRun = 0
            name.backgroundColor = RED
        }
        scoreLabel.text = "Score: \(score)"
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        score = 0
        longestRun = 0
        currentRun = 0
        lastAnswers = [String]()
        lastRealAnswers = [String]()
        seconds = TIME_LIMIT
        scoreLabel.text = "Score: \(score)"
        timerLabel.text = "Timer: \(seconds!)"
        update()
    }
    @IBAction func playPausePressed(_ sender: Any) {
        
        if playPauseButton.currentTitle == "Stop" {
            timer.invalidate()
            playPauseButton.setTitle("Play", for: [])
            imageView.isHidden = true
            name0.isHidden = true
            name1.isHidden = true
            name2.isHidden = true
            name3.isHidden = true
        }
        else {
            playPauseButton.setTitle("Stop", for: [])
            imageView.isHidden = false
            name0.isHidden = false
            name1.isHidden = false
            name2.isHidden = false
            name3.isHidden = false
            runTimer()
        }
    }
    
    @IBAction func statsPressed(_ sender: Any) {
        timer.invalidate()
        self.performSegue(withIdentifier: "toStatsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! StatsViewController
        destinationVC.score = score
        destinationVC.longestRun = longestRun
        destinationVC.currentRun = currentRun
        destinationVC.selectedNames = lastAnswers
        destinationVC.correctNames = lastRealAnswers
        
    }
    
    
    func runTimer() {
        if(timer.isValid == false) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(QuestionsViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
        
    }
    
    @objc func updateTimer() {
        
        if seconds < 0 {
            if seconds < -1 {
                if nameSelected == nil {
                    currentRun = 0
                    addNameSelected(name: "None", realName: currentName)
                }
                update()
            }
            else {
                seconds -= 1
            }
        }
        else {
            timerLabel.text = "Timer: \(seconds!)"
            seconds -= 1
            //This will decrement(count down)the seconds.
            //This will update the label.
        }
        
        
    }
    func addNameSelected(name : String, realName : String){
        if lastAnswers.count > 2 {
            lastAnswers.remove(at: 0)
            lastRealAnswers.remove(at: 0)
        }
        lastAnswers.append(name)
        lastRealAnswers.append(realName)
    }
    
    func resetTimer(){
        timer.invalidate()
        seconds = TIME_LIMIT
        isTimerRunning = false
        name0.backgroundColor = BLUE
        name1.backgroundColor = BLUE
        name2.backgroundColor = BLUE
        name3.backgroundColor = BLUE
        name0.isEnabled = true
        name1.isEnabled = true
        name2.isEnabled = true
        name3.isEnabled = true
        runTimer()
    }
    
    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
