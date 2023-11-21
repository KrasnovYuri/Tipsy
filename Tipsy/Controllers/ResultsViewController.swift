//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Юрий on 20.11.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipPercent = 10
    var numberOfPeople = 2
    var result: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", result)
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercent)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
