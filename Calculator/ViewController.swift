//
//  ViewController.swift
//  Calculator
//
//  Created by Norman Sutorius on 04.01.16.
//  Copyright © 2016 Norman Sutorius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfANumber: Bool = false
    
    @IBAction func appendDigits(sender: UIButton) {
        let digit = sender.currentTitle! //remove the optiona it means if not set the app crashes
        print("digit = \(digit)")
        let displayDigit = display.text
        if userIsInTheMiddleOfANumber {
            display.text = displayDigit!.stringByAppendingString(digit)
            
        }else{
            display.text = digit
            userIsInTheMiddleOfANumber = true
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

