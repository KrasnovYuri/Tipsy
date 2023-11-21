//
//  ViewController.swift
//  Tipsy
//
//  Created by Юрий on 20.11.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercent = 0.10
    var numberOfPeople = 2
    var result = 1.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        [zeroPctButton, tenPctButton, twentyPctButton].forEach {
            $0.isSelected = false
        }
        sender.isSelected = true
        
        guard let buttonTitle = sender.currentTitle else { return }
        guard let buttonTitleAsANumber = Double(buttonTitle.dropLast()) else { return }
        tipPercent = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%2.f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let doubleBill = Double(billTextField.text ?? "") else { return }
        result = doubleBill * (1 + tipPercent) / Double(numberOfPeople)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultsViewController else { return }
        resultVC.numberOfPeople = numberOfPeople
        resultVC.result = result
        resultVC.tipPercent = Int(tipPercent * 100)
    }
}


