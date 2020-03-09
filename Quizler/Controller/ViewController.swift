//
//  ViewController.swift
//  Quizler
//
//  Created by Girish on 04/03/20.
//  Copyright © 2020 Modefinserver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    var quizBrain = QuizBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight =  quizBrain.checkAnswer(userAnswer: userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI()  {
        choiceOneButton.setTitle(quizBrain.setTitle(index: 0), for: .normal)
        choiceTwoButton.setTitle(quizBrain.setTitle(index: 1), for: .normal)
        choiceThreeButton.setTitle(quizBrain.setTitle(index: 2), for: .normal)
        questionLable.text = quizBrain.getQuestionText();
        progressBar.progress = quizBrain.getProgress()
        scoreLable.text = "Score : \(quizBrain.getScore())"
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear;
    }
    
}

