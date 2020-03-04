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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    let quiz = [["Four + Two is equal to six", "True"],
                ["Five - Three is greater than one","True"],
                ["Three + Eight is less than ten","False"]]
    var questionNumber = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        if userAnswer == actualAnswer {
            print("Right")
        }else{
            print("Wrong")
        }
        if(questionNumber + 1 < quiz.count){
            questionNumber += 1;
        }else{
            questionNumber = 0;
        }
        updateUI()
    }
    func updateUI()  {
        questionLable.text = quiz[questionNumber][0];
    }
    
}

