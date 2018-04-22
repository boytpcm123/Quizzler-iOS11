//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var totalQuestion : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var widthProgressBar: NSLayoutConstraint!
    @IBOutlet weak var btnAnswerTrue: UIButton!
    @IBOutlet weak var btnAnswerFalse: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOver()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = sender.tag == 1 ? true : false
       
        checkAnswer()
    }
    
    
    func updateUI() {
        guard totalQuestion > questionNumber else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(restartAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)

            return
        }
        questionLabel.text = allQuestion.list[questionNumber].questionText
        
        progressLabel.text = "\(questionNumber+1)/\(totalQuestion)"
        scoreLabel.text = "Score: \(score)"
        
        widthProgressBar.constant = view.bounds.size.width * (CGFloat(questionNumber+1) / CGFloat(totalQuestion))
        
    }
    

    func nextQuestion() {
        questionNumber = questionNumber + 1
        updateUI()
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestion.list[questionNumber].answer {
            score = score + 1
            print("You got it!")
        } else {
            print("Wrong!")
        }
        nextQuestion()
    }
    
    
    func startOver() {
        questionNumber = 0;
        score = 0;
        totalQuestion = allQuestion.list.count
        updateUI()
    }
    
    
    
}
