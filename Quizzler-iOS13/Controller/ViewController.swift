//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let correctAnswer = quizBrain.checkAnswer(userAnswer)
        
        if correctAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()

//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.updateUI()
//        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(String(quizBrain.getScore()))"
        questionLabel.text = quizBrain.getQuestionText()
        choice1Button.setTitle(quizBrain.getChoiceButtonsText()[0], for: .normal)
        choice2Button.setTitle(quizBrain.getChoiceButtonsText()[1], for: .normal)
        choice3Button.setTitle(quizBrain.getChoiceButtonsText()[2], for: .normal)
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
}

