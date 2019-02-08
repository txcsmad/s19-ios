//
//  ViewController.swift
//  Flashlight
//
//  Created by Rishabh Thakkar on 2/7/19.
//  Copyright © 2019 ribsthak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Loaded view")
        view.backgroundColor = .black
        isOn = false
        light.setTitleColor(.white, for: .normal)
        light.setTitle("On", for: .normal)
    }

    @IBOutlet weak var light: UIButton!
    
    
    @IBAction func toggleLight(_ sender: Any) {
        if !isOn {
            view.backgroundColor = .white
            light.setTitleColor(.black, for: .normal)
            light.setTitle("Off", for: .normal)
        } else {
            view.backgroundColor = .black
            light.setTitleColor(.white, for: .normal)
            light.setTitle("On", for: .normal)
        }
        isOn = !isOn
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touched the screen")
    }
}

