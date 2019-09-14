//
//  StatsViewController.swift
//  MDB Mini Project 1
//
//  Created by Anik Gupta on 9/12/19.
//  Copyright © 2019 Anik Gupta. All rights reserved.
//

import UIKit
extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.layer.cornerRadius = 7.0
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}


class StatsViewController: UIViewController {
    var score = 0
    var longestRun = 0
    var currentRun = 0
    var selectedNames = [String]()
    var correctNames = [String]()

    let GRAY = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    let GREEN = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1)
    let RED = #colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1)
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var longestRunLabel: UILabel!
    @IBOutlet weak var currentRunLabel: UILabel!
    
    @IBOutlet weak var longestRunStack: UIStackView!
    @IBOutlet weak var scoreStack: UIStackView!
    @IBOutlet weak var currentRunStack: UIStackView!
    @IBOutlet weak var cImage0: UIImageView!
    @IBOutlet weak var cImage1: UIImageView!
    @IBOutlet weak var cImage2: UIImageView!
    @IBOutlet weak var cName0: UILabel!
    @IBOutlet weak var cName1: UILabel!
    @IBOutlet weak var cName2: UILabel!
    @IBOutlet weak var sImage0: UIImageView!
    @IBOutlet weak var sImage1: UIImageView!
    @IBOutlet weak var sImage2: UIImageView!
    @IBOutlet weak var sName0: UILabel!
    @IBOutlet weak var sName1: UILabel!
    @IBOutlet weak var sName2: UILabel!
    @IBOutlet weak var iDisplayLabel: UILabel!
    @IBOutlet weak var aDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)"
        longestRunLabel.text = "\(longestRun)"
        currentRunLabel.text = "\(currentRun)"
        
        longestRunStack.addBackground(color: GRAY)
        scoreStack.addBackground(color: GRAY)
        currentRunStack.addBackground(color: GRAY)
        
        cImage0.isHidden = true
        cImage1.isHidden = true
        cImage2.isHidden = true
        sImage0.isHidden = true
        sImage1.isHidden = true
        sImage2.isHidden = true
        cName0.isHidden = true
        cName1.isHidden = true
        cName2.isHidden = true
        sName0.isHidden = true
        sName1.isHidden = true
        sName2.isHidden = true
        
        cImage0.layer.cornerRadius = 7.0
        cImage1.layer.cornerRadius = 7.0
        cImage2.layer.cornerRadius = 7.0
        sImage0.layer.cornerRadius = 7.0
        sImage1.layer.cornerRadius = 7.0
        sImage2.layer.cornerRadius = 7.0
        
        iDisplayLabel.isHidden = true
        aDisplayLabel.isHidden = true
        
        if selectedNames.count > 0 {
            iDisplayLabel.isHidden = false
            aDisplayLabel.isHidden = false
            
            cImage0.isHidden = false
            sImage0.isHidden = false
            cName0.isHidden = false
            sName0.isHidden = false
            
            cImage0.image = Constants.getImageFor(name: correctNames[0])
            sImage0.image = Constants.getImageFor(name: selectedNames[0])
            
            cName0.text = correctNames[0]
            sName0.text = selectedNames[0]
            
            if correctNames[0] == selectedNames[0] {
                sName0.textColor = GREEN
                sImage0.layer.borderColor = GREEN.cgColor
                sImage0.layer.borderWidth = 10
            }
            else {
                sName0.textColor = RED
                sImage0.layer.borderColor = RED.cgColor
                sImage0.layer.borderWidth = 10
            }
        }
        if selectedNames.count > 1 {
            cImage1.isHidden = false
            sImage1.isHidden = false
            cName1.isHidden = false
            sName1.isHidden = false
            
            cImage1.image = Constants.getImageFor(name: correctNames[1])
            sImage1.image = Constants.getImageFor(name: selectedNames[1])
            
            cName1.text = correctNames[1]
            sName1.text = selectedNames[1]
            
            if correctNames[1] == selectedNames[1] {
                sName1.textColor = GREEN
                sImage1.layer.borderColor = GREEN.cgColor
                sImage1.layer.borderWidth = 10
            }
            else {
                sName1.textColor = RED
                sImage1.layer.borderColor = RED.cgColor
                sImage1.layer.borderWidth = 10
            }
        }
        if selectedNames.count > 2 {
            cImage2.isHidden = false
            sImage2.isHidden = false
            cName2.isHidden = false
            sName2.isHidden = false
            
            cImage2.image = Constants.getImageFor(name: correctNames[2])
            sImage2.image = Constants.getImageFor(name: selectedNames[2])
            
            cName2.text = correctNames[2]
            sName2.text = selectedNames[2]
            
            if correctNames[2] == selectedNames[2] {
                sName2.textColor = GREEN
                sImage2.layer.borderColor = GREEN.cgColor
                sImage2.layer.borderWidth = 10
            }
            else {
                sName2.textColor = RED
                sImage2.layer.borderColor = RED.cgColor
                sImage2.layer.borderWidth = 10
            }
        }

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
