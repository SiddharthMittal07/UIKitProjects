//
//  HomeViewController.swift
//  BMICalculator
//
//  Created by Siddharth Mittal on 30/07/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    private var height: Float = 1.5
    private var weight: Float = 100
    private var bmi: BMIModel?
    private let brain = BMIBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var wieghtSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        height = sender.value
        heightLabel.text = "\(String(format: "%.1f", height)) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weight = sender.value
        weightLabel.text = "\(String(format: "%.0f", weight)) Kg"
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        bmi = brain.calculateBMI(weight: weight, height: height)
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! ResultsViewController
        vc.value = bmi?.value
        vc.advice = bmi?.advice
        vc.color = bmi?.color
    }
}

