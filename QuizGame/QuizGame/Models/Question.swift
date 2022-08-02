//
//  Question.swift
//  QuizGame
//
//  Created by Siddharth Mittal on 29/07/22.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
