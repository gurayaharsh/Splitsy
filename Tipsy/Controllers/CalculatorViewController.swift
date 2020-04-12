//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTotalInput: UITextField!
    
    @IBOutlet weak var pctBtn0: UIButton!
    
    @IBOutlet weak var pctBtn10: UIButton!
    
    @IBOutlet weak var pctBtn20: UIButton!
    
    @IBOutlet weak var splitNumLabel: UILabel!
    
    //base values
    var tip =  0.10
    var splitNum = 2
    var billTotal = 0.00
    var split = 0.00

    
    @IBAction func tipSelected(_ sender: UIButton) {
        
        billTotalInput.endEditing(true)
        
        // unhighlight previously selected tips
        
        pctBtn0.isSelected = false
        pctBtn10.isSelected = false
        pctBtn20.isSelected = false
        
        // highlight newly selected tip
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let selectedTip = String(buttonTitle.dropLast())
        
        tip = Double(selectedTip)!/100
    
        
    }
    
    @IBAction func splitNumChanged(_ sender: UIStepper) {

        billTotalInput.endEditing(true)
        let stepperVal = Int(sender.value)
        splitNum = stepperVal
        splitNumLabel.text = "\(splitNum)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if billTotalInput.text != "" {
            billTotal = Double(billTotalInput.text ?? "0.00")!
            let tot = tip*billTotal + billTotal
            split = tot/Double(splitNum)
        }
        else {
            billTotal = 0.00
            split = 0.00
        }
        

        self.performSegue(withIdentifier: "displayCalculatedSplit", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "displayCalculatedSplit"{

            let destinationVC = segue.destination as! ResultViewController
            destinationVC.split = split
            destinationVC.tip = tip
            destinationVC.splitNum = splitNum
        }
    }

    
    
}

