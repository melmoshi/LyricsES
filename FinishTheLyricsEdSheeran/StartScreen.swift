//
//  StartScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-13.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit


var points = 0


class StartScreen: UIViewController {
    
    
    //Question Label
    @IBOutlet weak var questionLbl: UILabel!
    
    
    var currentQuestion = 0
    var rightAnswerPlacement = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if levelChosen == "Easy" {
            parseCSV(difficulty: "EasyLyrics")
        } else {
            parseCSV(difficulty: "HardLyrics")
        }
        
        updateArray()
        
        newQuestion()
    }
    
    
    //Function that displays new question
    func newQuestion() {
        questionLbl.text = newArray[currentQuestion].question
        
        rightAnswerPlacement = Int(arc4random_uniform(3)) + 1
        
        //create button
        var button: UIButton = UIButton()
        
        //var x = 1
        
        for i in 1...4 {
            
            //create button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(newArray[currentQuestion].answer, for: .normal)
            } else if (i == 1) {
                button.setTitle(newArray[currentQuestion].wrong1, for: .normal)
            } else if (i == 2) {
                button.setTitle(newArray[currentQuestion].wrong2, for: .normal)
            } else if (i == 3) {
                button.setTitle(newArray[currentQuestion].wrong3, for: .normal)
            } else {
                button.setTitle(newArray[currentQuestion].wrong4, for: .normal)
            }
            
        }
        
        currentQuestion += 1
        
    }
    
    
    //Button
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender.tag == Int(rightAnswerPlacement) {
            
            print("RIGHT")
            points += 1
            
        } else {
            print("WRONG!!!!!!")
        }
        
        if (currentQuestion != questions.count) {
            newQuestion()
        } else {
            //if there are no new questions left
            performSegue(withIdentifier: "showScore", sender: self)
        }
        
    }
}


