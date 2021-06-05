//
//  ViewController.swift
//  CatchTheGina
//
//  Created by Bakyt Dzhumabaev on 31/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var counter = 0
    var timer = Timer()
    var hideTimer = Timer()
    var dinoArray = [UIImageView]()
    var highScore = 0

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
        
        let highScoreStored = UserDefaults.standard.object(forKey: "highscore")
        if highScoreStored == nil {
            highScore = 0
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        
        if let newScore = highScoreStored as? Int {
            highScore = newScore
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        
        dino1.isUserInteractionEnabled = true
        dino2.isUserInteractionEnabled = true
        dino3.isUserInteractionEnabled = true
        dino4.isUserInteractionEnabled = true
        dino5.isUserInteractionEnabled = true
        dino6.isUserInteractionEnabled = true
        dino7.isUserInteractionEnabled = true
        dino8.isUserInteractionEnabled = true
        dino9.isUserInteractionEnabled = true
        
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
        
        counter = 10
        timeLabel.text = String(counter) //"\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown) , userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideDino), userInfo: nil, repeats: true)
        
        dinoArray = [dino1, dino2, dino3, dino4, dino5, dino6, dino7, dino8, dino9]
        hideDino()
        
    }
    
    @objc func hideDino() {
        for dino in dinoArray {
            dino.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(dinoArray.count)))
        dinoArray[random].isHidden = false
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for dino in dinoArray {
                dino.isHidden = true
            }
            //HighScore
            if self.score > self.highScore {
                self.highScore = self.score
                highscoreLabel.text = "Score: \(self.highScore)"
                UserDefaults.standard.setValue(self.highScore, forKey: "highscore")
            }
            
            //Alert
            let alert = UIAlertController(title: "Time's up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                // replay function
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown) , userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideDino), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }


}

