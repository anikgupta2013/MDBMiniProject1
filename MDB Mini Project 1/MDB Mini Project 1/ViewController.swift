//
//  ViewController.swift
//  MDB Mini Project 1
//
//  Created by Anik Gupta on 9/11/19.
//  Copyright © 2019 Anik Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPressend(_ sender: Any) {
        self.performSegue(withIdentifier: "toQuestionsVC", sender: self)
    }
}

