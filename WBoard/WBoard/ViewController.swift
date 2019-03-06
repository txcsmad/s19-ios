//
//  ViewController.swift
//  WBoard
//
//  Created by Rishabh Thakkar on 2/28/19.
//  Copyright © 2019 ribsthak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var canvas: CanvasView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.layer.borderColor = UIColor.black.cgColor
        canvas.layer.borderWidth = 2.0
        
        
    }

    @IBAction func undo(_ sender: Any) {
        canvas.undo()
    }
    @IBAction func setBlack(_ sender: Any) {
        canvas.setColor(col: .black)
    }
    
    @IBAction func setBlue(_ sender: Any) {
        canvas.setColor(col: .blue)
    }
    
    @IBAction func setRed(_ sender: Any) {
        canvas.setColor(col: .red)
    }
    @IBAction func setUT(_ sender: Any) {
        canvas.setColor(col: .orange)
    }
    @IBAction func setPurple(_ sender: Any) {
        canvas.setColor(col: .purple)
    }
    @IBAction func setYellow(_ sender: Any) {
        canvas.setColor(col: .yellow)
    }
    @IBAction func setGreen(_ sender: Any) {
        canvas.setColor(col: .green)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let point = touch.location(in: canvas)
        canvas.startPath(point: point)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let point = touch.location(in: canvas)
        canvas.add(point: point)
    }
    
}

class CanvasView:UIView {
    var paths = [[CGPoint]]()
    var colors = [UIColor]()
    var color:UIColor = .black
    
    func startPath(point: CGPoint) {
        paths.append([point])
        colors.append(color)
        setNeedsDisplay()
    }
    
    func add(point: CGPoint) {
        guard let _ = paths.last else {
            return
        }
        paths[paths.count - 1].append(point)
        setNeedsDisplay()
    }
    
    func undo() {
        guard paths.count > 0 && colors.count > 0 else {
            return
        }
        paths.removeLast()
        colors.removeLast()
        setNeedsDisplay()
    }
    
    func setColor(col: UIColor) {
        color = col
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var index = 0
        for path in paths {
            guard let start = path.first else {
                continue
            }
            let bezierPath = UIBezierPath()
            bezierPath.move(to: start)
            
            for point in path {
                bezierPath.addLine(to: point)
            }
            
            color = colors[index]
            print(color)
            color.set()
            bezierPath.lineWidth = 2.0
            bezierPath.stroke()
            index += 1
        }
    }
}
