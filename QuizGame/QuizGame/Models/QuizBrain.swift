//
//  QuizBrain.swift
//  QuizGame
//
//  Created by Siddharth Mittal on 29/07/22.
//

import Foundation

struct QuizBrain {
    
    private let questions = [
        Question(q: "The atomic number for lithium is 17", a: "False"),
        Question(q: "A cross between a horse and a zebra is called a 'Hobra'", a: "False"),
        Question(q: "The black box in a plane is black", a: "False"),
        Question(q: "Alliumphobia is a fear of garlic", a: "True"),
        Question(q: "Prince Harry is taller than Prince William", a: "False"),
        Question(q: "The star sign Aquarius is represented by a tiger", a: "True")
    ]
    
    private var questionNumber = 0
    private var score = 0
    
    func getQuestion() -> String {
        return questions[questionNumber].text
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == questions[questionNumber].answer {
            score += 1
            return true
        }
        return false
    }
    
    mutating func nextQuestion() {
        if questionNumber < questions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getPercentage() -> Float {
        return Float(questionNumber + 1) / Float(questions.count)
    }
    
    func getScore() -> String {
        return "\(score)"
    }
    
    
}
