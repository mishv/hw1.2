//
//  ViewController.swift
//  hw1.2
//
//  Created by Misha on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    //MARK: - Public Properties
    var count = 1
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        
        startButton.setTitle("Start", for: UIControl.State.normal)
        startButton.layer.cornerRadius = 7
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        redLightView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.3)
        
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        yellowLightView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
        
        
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        greenLightView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.3)
        
    }
    
    
    // MARK: - IB Actions
    @IBAction func startButtonPressed() {
        startButton.setTitle("Next", for: UIControl.State.normal)
    
        switch count {
        case 1:
            greenLightView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.3)
            redLightView.backgroundColor = UIColor.systemRed.withAlphaComponent(1)
            break
        case 2:
            redLightView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.3)
            yellowLightView.backgroundColor = UIColor.systemYellow.withAlphaComponent(1)

        case 3:
            yellowLightView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
            greenLightView.backgroundColor = UIColor.systemGreen.withAlphaComponent(1)
        default:
            return
        }
        
        if count != 3 {
            count += 1
        } else {
        count = 1
        }
        
    }

}

