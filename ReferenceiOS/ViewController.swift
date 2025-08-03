//
//  ViewController.swift
//  ReferenceiOS
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel! {
        didSet {
            label.accessibilityIdentifier = "welcomeMessage"
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
                    button.accessibilityIdentifier = "generateButton"
                }
    }

    @IBAction func generate(_ sender: Any) {
        /*Generate amount
        Added Double instead of Float in order to remove
        warning: '99999999' is not exactly representable as 'Float'; it becomes '100000000' */
        
        let amount = Double.random(in: 100 ..< 99999999)

        // Format
        if let formattedAmount = CurrencyHelper.format(amount: amount as NSNumber) {
            label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
            label.accessibilityIdentifier = "generatedCurrencyOutput"
        }
        
        // Set pure nummerical value for
        label.accessibilityValue = String(amount)
    }
}
