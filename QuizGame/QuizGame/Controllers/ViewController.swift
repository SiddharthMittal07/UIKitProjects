//
//  ViewController.swift
//  QuizGame
//
//  Created by Siddharth Mittal on 29/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!

    private var timer = Timer()
    private var game = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.setTitle("True", for: .normal)
        falseButton.setTitle("False", for: .normal)
        updateUI()
    }

    @IBAction func choicePressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        if game.checkAnswer(userAnswer: userAnswer) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        game.nextQuestion()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil , repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = game.getQuestion()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = game.getPercentage()
        scoreLabel.text = "Score: \(game.getScore())"
    }
    
}

