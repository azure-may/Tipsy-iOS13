//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Azure May Burmeister on 2/24/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var data: Result?

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = data?.result
        messageLabel.text = data?.message
    }
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
