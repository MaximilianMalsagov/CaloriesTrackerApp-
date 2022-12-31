//
//  ViewController.swift
//  Game
//
//  Created by Maximilian on 31.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var myHand = ""
    let hands =  ["👊", "✋", "✌️"]
    let losesAgainst =  ["👊": "✌️", "✋":"👊", "✌️":"✋"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectRock(_ sender: Any) {
        myHand = "👊"
        label.text = "You selected \(myHand)"
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        myHand = "✋"
        label.text = "You selected \(myHand)"

    }
    
    @IBAction func selectScissors(_ sender: Any) {
        myHand = "✌️"
        label.text = "You selected \(myHand)"

    }
    func finishGame() {
        let iphoneHand = hands.randomElement()!
        var message = ""
        if iphoneHand == myHand {
            message = "it is a 👔"
            
        }else if losesAgainst [iphoneHand] == myHand {
            message = "Iphone wins"
        }else {
            message = "You won"
        }
        label.text = "you selected \(myHand)\niPhone  selected\(iphoneHand)\n\(message)"
    }
    
    @IBAction func play(_ sender: Any) {
        var counter = 3
        
        Timer.scheduledTimer(withTimeInterval: 1.0,
                             repeats: true) {
            timer in if counter > 0 {
                self.label.text = "You selected \(self.myHand)\n\(counter)"
            }else {
                timer.invalidate()
                self.finishGame()
            }
            counter -= 1
}
}
}

