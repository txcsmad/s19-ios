//
//  ViewController.swift
//  Calculator
//
//  Created by Avinash on 2/14/19.
//  Copyright © 2019 SecondGenPESH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var lhs: Int?
    var operation: Operation?
    
    
    @IBAction func clear(_ sender: Any) {
        lhs = nil
        operation = nil
        label.text = "0"
    }
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        guard let lhsString = label.text, let operationString = sender.titleLabel?.text else {
            return
        }
        
        lhs = Int(lhsString)
        operation = Operation(rawValue: operationString)
        label.text = operationString
        
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        guard let lhs = lhs, let operation = operation, let rhsString = label.text, let rhs = Int(rhsString) else {
            return
        }
        
        let result = operation.performOperation(lhs, rhs)
        label.text = "\(result)"
    }
    
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let string = label.text, let numberString = sender.titleLabel?.text, let number = Int(numberString) else {
            return
        }
        
        if let int = Int(string) {
            label.text = "\((int * 10) + number)"
        } else {
            label.text = "\(number)"
        }
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

