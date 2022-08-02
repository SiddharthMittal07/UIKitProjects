//
//  BMIBrain.swift
//  BMICalculator
//
//  Created by Siddharth Mittal on 30/07/22.
//

import UIKit

class BMIBrain {
    func calculateBMI(weight: Float, height: Float) -> BMIModel {
        let value = weight / (height * height)
        var advice: String
        var color: UIColor
        
        if value < 18.9 {
            advice = "You need to eat more pies 🥧"
            color = .blue
        } else if value < 24.9 {
            advice = "You are eating the correct amount of pies 🥧 and vegetables 🥕"
            color = .green
        } else {
            advice = "You need to stop eating pies and switch to vegetables 🥕"
            color = .red
        }
        
        return BMIModel(value: value, advice: advice, color: color)
    }

}
