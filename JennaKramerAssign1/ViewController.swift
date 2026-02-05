//
//  ViewController.swift
//  JennaKramerAssign1
//
//  Created by Kramer, Jenna L. on 2/3/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputValue: UITextField!
    @IBOutlet weak var outputValue: UILabel!
    @IBOutlet weak var unitButtonSelect: UIButton!
    
    
    @IBAction func unitSelectButton(_ sender: Any) {
        let alert = UIAlertController(title: "Select Unit", message: "Choose the unit of your input value", preferredStyle: .alert)
        
        let celciusAction = UIAlertAction(title: "Celsius", style: .default) { _ in
            self.unitButtonSelect.setTitle("Celsius", for: .normal)
        }
        
        let fahrenheitAction = UIAlertAction(title: "Fahrenheit", style: .default) { _ in
            self.unitButtonSelect.setTitle("Fahrenheit", for: .normal)
        }
        
        let kilometersAction = UIAlertAction(title: "Kilometers", style: .default) { _ in
            self.unitButtonSelect.setTitle("Kilometers", for: .normal)
        }
        
        let milesAction = UIAlertAction(title: "Miles", style: .default) { _ in
            self.unitButtonSelect.setTitle("Miles", for: .normal)
        }
        alert.addAction(celciusAction)
        alert.addAction(fahrenheitAction)
        alert.addAction(kilometersAction)
        alert.addAction(milesAction)
        present(alert, animated: true)
    }
    
    @IBAction func convertButton(_ sender: Any) {
        guard let inputString = inputValue.text, let inputDouble = Double(inputString) else {
            outputValue.text = "Please enter a valid number"
            return
        }
        let selectedUnit = unitButtonSelect.title(for: .normal) ?? "Select Unit"
        
        var result: Double = 0.0
        var outputUnitString = ""
        
        // Celsius -> Converts to Fahrenheit
        // Fahrenheit -> Converts to Celsius
        // Kilometers -> Converts to Miles
        // Miles -> Converts to Kilometers
        
        switch selectedUnit {
        case "Celsius":
            // Formula: (C * 9/5) + 32
            result = (inputDouble * 9/5) + 32
            outputUnitString = "Fahrenheit"
            
        case "Fahrenheit":
            // Formula: (F - 32) * 5/9
            result = (inputDouble - 32) * 5/9
            outputUnitString = "Celsius"
            
        case "Kilometers":
            // Formula: Km * 0.621371
            result = inputDouble * 0.621371
            outputUnitString = "Miles"
            
        case "Miles":
            // Formula: Mi / 0.621371
            result = inputDouble / 0.621371
            outputUnitString = "Kilometers"
            
        default:
            outputValue.text = "Please select a unit first"
            return
        }
        
        outputValue.text = "\(result) \(outputUnitString)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

