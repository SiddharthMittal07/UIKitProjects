//
//  ResultsViewController.swift
//  BMICalculator
//
//  Created by Siddharth Mittal on 30/07/22.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var bmiAdvice: UILabel!
    
    var value: Float?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value = value {
            bmiValue.text = String(format: "%.1f", value)
        }
        bmiAdvice.text = advice
        view.backgroundColor = color
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

}
