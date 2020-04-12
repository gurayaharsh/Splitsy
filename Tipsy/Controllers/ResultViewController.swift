//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Harsh  on 2020-04-12.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var split: Double?
    var splitNum: Int?
    var tip: Double?

    @IBOutlet weak var amountPerPerson: UILabel!
    @IBOutlet weak var parametersLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipPct = String(format: "%.0f", tip! * 100)
        amountPerPerson.text = String(format: "%.2f", split!)
        parametersLabel.text = "Split between \(splitNum!) people with a tip of \(tipPct) %"
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
