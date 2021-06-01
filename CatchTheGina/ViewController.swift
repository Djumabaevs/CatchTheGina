//
//  ViewController.swift
//  CatchTheGina
//
//  Created by Bakyt Dzhumabaev on 31/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var dino9: UIImageView!
    @IBOutlet weak var dino8: UIImageView!
    @IBOutlet weak var dino7: UIImageView!
    @IBOutlet weak var dino6: UIImageView!
    @IBOutlet weak var dino4: UIImageView!
    @IBOutlet weak var dino5: UIImageView!
    @IBOutlet weak var dino1: UIImageView!
    @IBOutlet weak var dino3: UIImageView!
    @IBOutlet weak var dino2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        dino1.addGestureRecognizer(recognizer1)
        dino2.addGestureRecognizer(recognizer2)
        dino3.addGestureRecognizer(recognizer3)
        dino4.addGestureRecognizer(recognizer4)
        dino5.addGestureRecognizer(recognizer5)
        dino6.addGestureRecognizer(recognizer6)
        dino7.addGestureRecognizer(recognizer7)
        dino8.addGestureRecognizer(recognizer8)
        dino9.addGestureRecognizer(recognizer9)
    }
    
    @objc func increaseScore() {
        
    }


}

