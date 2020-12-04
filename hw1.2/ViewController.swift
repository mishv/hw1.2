//
//  ViewController.swift
//  hw1.2
//
//  Created by Misha on 02.12.2020.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var redPointsLabel: UILabel!
    @IBOutlet var greenPointsLabel: UILabel!
    @IBOutlet var bluePointsLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBOutlet var startButton: UIButton!
    
    // MARK: - Public Properties
    var currentLight = CurrentLight.red
    let lightIsOn: CGFloat = 1
    let lightIsOff: CGFloat = 0.2
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 7
        
        redLightView.backgroundColor = UIColor.systemRed
        redLightView.alpha = lightIsOff
        
        yellowLightView.backgroundColor = UIColor.systemYellow
        yellowLightView.alpha = lightIsOff
        
        greenLightView.backgroundColor = UIColor.systemGreen
        greenLightView.alpha = lightIsOff
        
        // MARK: Sliders
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.value = 0
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.value = 0
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.value = 0
        
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        
    }
    
    // MARK: - IB Actions
    @IBAction func startButtonPressed() {
        startButton.setTitle("Next", for: .normal)
    
        switch currentLight {
        case .red:
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            currentLight = .yellow
            
        case .yellow:
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            currentLight = .green

        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .red
            
        }
        
    }
    
    @IBAction func redSliderAction(_ sender: Any) {
        redPointsLabel.text = String(NSString(format: "%0.2f", redSlider.value))
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        greenPointsLabel.text = String(NSString(format: "%0.2f", greenSlider.value))
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        bluePointsLabel.text = String(NSString(format: "%0.2f", blueSlider.value))
    }
    
    
    

}

