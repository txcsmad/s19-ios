//
//  ViewController.swift
//  trivia
//
//  Created by Rishabh Thakkar on 3/9/19.
//  Copyright © 2019 ribsthak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerInput: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    let questions = ["Which fictional city is the home of Batman?", "Spinach is high in which mineral?", "What is a Geiger Counter used to detect?", "What was Mohammed Ali’s birth name?", "In Greek mythology, who turned all that he touched into gold?"]
    let answers = ["Gotham City", "Iron", "Radiation", "Cassius Clay", "King Midas"]
    
    var index:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkButton.isHidden = true
        resetButton.isHidden = true
        answerInput.isHidden = true
    }

    
    @IBAction func begin(_ sender: Any) {
        startButton.isHidden = true
        checkButton.isHidden = false
        resetButton.isHidden = false
        answerInput.isHidden = false
        populateQuestion()
    }
    
    func populateQuestion() {
        index = Int.random(in: 0..<questions.count)
        questionLabel.text = questions[index]
    }
    
    @IBAction func checkAnswer(_ sender: Any) {
        guard let ans = answerInput.text else {
            return
        }
        
        if answers[index].lowercased() == ans.lowercased() {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .red
        }
    }
    
    @IBAction func resetQuestion(_ sender: Any) {
        populateQuestion()
        view.backgroundColor = .white
        answerInput.text = ""
    }
    
}

