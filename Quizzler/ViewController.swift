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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalQuestion = allQuestion.list.count
        updateUI()
        
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
            //let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(restartAction)
            //alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)

            return
        }
        questionLabel.text = allQuestion.list[questionNumber].questionText
        
        progressLabel.text = "\(questionNumber+1)/\(totalQuestion)"
        scoreLabel.text = "Score: \(score)"
        
        progressBar.frame.size.width = (view.bounds.size.width / CGFloat(totalQuestion)) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        questionNumber = questionNumber + 1
        updateUI()
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestion.list[questionNumber].answer {
            ProgressHUD.showSuccess("Correct!")
            score = score + 1
        } else {
            ProgressHUD.showSuccess("Wrong!")
        }
        nextQuestion()
    }
    
    
    func startOver() {
        questionNumber = 0;
        score = 0;
        updateUI()
    }
    
    
    
}
