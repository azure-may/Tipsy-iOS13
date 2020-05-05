//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var subtotalLabel: UITextField!
    @IBOutlet var tipOptions: [UIButton]!
    @IBOutlet weak var splitLabel: UILabel!
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subtotalLabel.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedChars = ".1234567890"
        let allowedCharSet = CharacterSet(charactersIn: allowedChars)
        let typedCharSet = CharacterSet(charactersIn: string)
        return allowedCharSet.isSuperset(of: typedCharSet)
    }
    
    @IBAction func subtotalEntered(_ sender: UITextField) {
        calculateBrain.subtotal = Double(sender.text!) ?? 0.0
    }
    
    @IBAction func tipOptionSelected(_ sender: UIButton) {
        clearButtons()
        sender.isSelected = true
        calculateBrain.updateTip(ind: sender.tag)
    }
    
    @IBAction func splitAdjusted(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        calculateBrain.split = sender.value
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculateBrain.calculateTotalPP()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func clearButtons() {
        tipOptions.forEach {
            $0.isSelected = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.data = calculateBrain.returnResult()
        }
    }
    
}

