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
    var userIsInTheMiddleOfANumber = false
    
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
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfANumber{
            enter()
        }
        switch operation {
            case "×": performOperation {$0 * $1}
            /*
            this is the closure for (Double, Double) -> Double)
            instead of 
            func multiply(op1: Double, op2 Double) -> Double{
                return op1 * op2
            }
            or long closure
            case "×": performOperation({op1: Double, op2 Double) -> Double in
                return op1 * op2
            })
            
            */
            case "÷": performOperation {$1 / $0}
            case "+": performOperation {$0 + $1}
            case "−": performOperation {$1 - $0}
            case "√": performOperation {sqrt($0)}
            
            default: break
        }
    }
    
    private func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfANumber = false
        operandStack.append(displayValue);
        print("operand Stack = \(operandStack)")
        
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfANumber = false
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

