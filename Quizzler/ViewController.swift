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
    var currentQuestion : Question?
    var indexQuestion : Int = 0
    var totalQuestion : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var widthProgressBar: NSLayoutConstraint!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOver()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = sender.tag == 1 ? true : false
       
        checkAnswer()
    }
    
    
    func updateUI() {
        guard totalQuestion > indexQuestion else {
            return
        }
        currentQuestion = allQuestion.list[indexQuestion]
        questionLabel.text = currentQuestion?.questionText
        
        progressLabel.text = "\(indexQuestion+1)/\(totalQuestion)"
        scoreLabel.text = "\(score)"
        
        widthProgressBar.constant = view.bounds.size.width * (CGFloat(indexQuestion+1) / CGFloat(totalQuestion))
        
    }
    

    func nextQuestion() {
        indexQuestion = indexQuestion + 1
        updateUI()
    }
    
    
    func checkAnswer() {
        if pickedAnswer == currentQuestion?.answer {
            score = score + 1
        }
        nextQuestion()
    }
    
    
    func startOver() {
        totalQuestion = allQuestion.list.count
        updateUI()
    }
    
    
    
}
