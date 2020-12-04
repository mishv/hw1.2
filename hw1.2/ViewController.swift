//
//  ViewController.swift
//  hw1.2
//
//  Created by Misha on 02.12.2020.
//

import UIKit

enum CurrentLight {
    case first, second, third
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
    var currentLight = CurrentLight.first
    
    let lightIsOn: CGFloat = 1
    let lightIsOff: CGFloat = 0.2
    
//    var redColorPoint: CGFloat = 0
//    var greenColorPoint: CGFloat = 0
//    var blueColorPoint: CGFloat = 0
    
    var currentView: UIView?
    
    var firstViewRP: CGFloat = 0
    var firstViewGP: CGFloat = 0
    var firstViewBP: CGFloat = 0
    
    var secondViewRP: CGFloat = 0
    var secondViewGP: CGFloat = 0
    var secondViewBP: CGFloat = 0
    
    var thirdViewRP: CGFloat = 0
    var thirdViewGP: CGFloat = 0
    var thirdViewBP: CGFloat = 0
    
    
    var firstRedLabel: String = "0.00"
    var firstGreenLabel: String = "0.00"
    var firstBlueLabel: String = "0.00"
    
    var secondRedLabel: String = "0.00"
    var secondGreenLabel: String = "0.00"
    var secondBlueLabel: String = "0.00"
    
    var thirdRedLabel: String = "0.00"
    var thirdGreenLabel: String = "0.00"
    var thirdBlueLabel: String = "0.00"
    
    
    
    
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.isEnabled = false
        greenSlider.isEnabled = false
        blueSlider.isEnabled = false
        
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 7
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
        
//        redLightView.backgroundColor = UIColor(red: redColorPoint, green: greenColorPoint, blue: blueColorPoint, alpha: 5)
        
//        yellowLightView.backgroundColor = UIColor.systemYellow
//        yellowLightView.alpha = lightIsOff
//
//        greenLightView.backgroundColor = UIColor.systemGreen
//        greenLightView.alpha = lightIsOff
        
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
        
        redSlider.isEnabled = true
        greenSlider.isEnabled = true
        blueSlider.isEnabled = true
    
        switch currentLight {
        case .first:
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            
            currentLight = .second
            currentView = redLightView
            
            redSlider.value = Float(firstViewRP)
            greenSlider.value = Float(firstViewGP)
            blueSlider.value = Float(firstViewBP)
            
            redPointsLabel.text = firstRedLabel
            greenPointsLabel.text = firstGreenLabel
            bluePointsLabel.text = firstBlueLabel

        case .second:
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            currentLight = .third
            currentView = yellowLightView
            redSlider.value = Float(secondViewRP)
            greenSlider.value = Float(secondViewGP)
            blueSlider.value = Float(secondViewBP)
            
            redPointsLabel.text = secondRedLabel
            greenPointsLabel.text = secondGreenLabel
            bluePointsLabel.text = secondBlueLabel

        case .third:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .first
            currentView = greenLightView
            redSlider.value = Float(thirdViewRP)
            greenSlider.value = Float(thirdViewGP)
            blueSlider.value = Float(thirdViewBP)
            
            redPointsLabel.text = thirdRedLabel
            greenPointsLabel.text = thirdGreenLabel
            bluePointsLabel.text = thirdBlueLabel
            
        }
        
    }
    
    @IBAction func redSliderAction(_ sender: Any) {
//        redPointsLabel.text = String(NSString(format: "%0.2f", redSlider.value))
//        redColorPoint = CGFloat(redSlider.value)
//        redLightView.backgroundColor = UIColor(red: redColorPoint/255, green: greenColorPoint/255, blue:  blueColorPoint/255, alpha: 1)
        
        switch currentView {
        case redLightView:
            firstViewRP = CGFloat(redSlider.value)
            currentView?.backgroundColor = UIColor(red: firstViewRP/255, green: firstViewGP/255, blue: firstViewBP/255, alpha: 1)
            redPointsLabel.text = String(NSString(format: "%0.2f", redSlider.value))
            firstRedLabel = String(NSString(format: "%0.2f", redSlider.value))
            
        case yellowLightView:
            secondViewRP = CGFloat(redSlider.value)
            currentView?.backgroundColor = UIColor(red: secondViewRP/255, green: secondViewGP/255, blue: secondViewBP/255, alpha: 1)
            redPointsLabel.text = String(NSString(format: "%0.2f", redSlider.value))
            secondRedLabel = String(NSString(format: "%0.2f", redSlider.value))
            
        case greenLightView:
            thirdViewRP = CGFloat(redSlider.value)
            currentView?.backgroundColor = UIColor(red: thirdViewRP/255, green: thirdViewGP/255, blue: thirdViewBP/255, alpha: 1)
            redPointsLabel.text = String(NSString(format: "%0.2f", redSlider.value))
            thirdRedLabel = String(NSString(format: "%0.2f", redSlider.value))
            
            
        default:
            return
        }
    
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
//        greenPointsLabel.text = String(NSString(format: "%0.2f", greenSlider.value))
//        greenColorPoint = CGFloat(greenSlider.value)
//        redLightView.backgroundColor = UIColor(red: redColorPoint/255, green: greenColorPoint/255, blue:  blueColorPoint/255, alpha: 1)
        switch currentView {
        case redLightView:
            firstViewGP = CGFloat(greenSlider.value)
            currentView?.backgroundColor = UIColor(red: firstViewRP/255, green: firstViewGP/255, blue: firstViewBP/255, alpha: 1)
            greenPointsLabel.text = String(NSString(format: "%0.2f", greenSlider.value))
            firstGreenLabel = String(NSString(format: "%0.2f", greenSlider.value))
            
        case yellowLightView:
            secondViewGP = CGFloat(greenSlider.value)
            currentView?.backgroundColor = UIColor(red: secondViewRP/255, green: secondViewGP/255, blue: secondViewBP/255, alpha: 1)
            greenPointsLabel.text = String(NSString(format: "%0.2f", greenSlider.value))
            secondGreenLabel = String(NSString(format: "%0.2f", greenSlider.value))
            
        case greenLightView:
            thirdViewGP = CGFloat(greenSlider.value)
            currentView?.backgroundColor = UIColor(red: thirdViewRP/255, green: thirdViewGP/255, blue: thirdViewBP/255, alpha: 1)
            greenPointsLabel.text = String(NSString(format: "%0.2f", greenSlider.value))
            thirdGreenLabel = String(NSString(format: "%0.2f", greenSlider.value))
            
        default:
            return
        }
        
        
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
//        bluePointsLabel.text = String(NSString(format: "%0.2f", blueSlider.value))
//        blueColorPoint = CGFloat(blueSlider.value)
//        redLightView.backgroundColor = UIColor(red: redColorPoint/255, green: greenColorPoint/255, blue:  blueColorPoint/255, alpha: 1)
        switch currentView {
        case redLightView:
            firstViewBP = CGFloat(blueSlider.value)
            currentView?.backgroundColor = UIColor(red: firstViewRP/255, green: firstViewGP/255, blue:  firstViewBP/255, alpha: 1)
            bluePointsLabel.text = String(NSString(format: "%0.2f", blueSlider.value))
            firstBlueLabel = String(NSString(format: "%0.2f", blueSlider.value))
            
        case yellowLightView:
            secondViewBP = CGFloat(blueSlider.value)
            currentView?.backgroundColor = UIColor(red: secondViewRP/255, green: secondViewGP/255, blue:  secondViewBP/255, alpha: 1)
            bluePointsLabel.text = String(NSString(format: "%0.2f", blueSlider.value))
            secondBlueLabel = String(NSString(format: "%0.2f", blueSlider.value))
            
        case greenLightView:
            thirdViewBP = CGFloat(blueSlider.value)
            currentView?.backgroundColor = UIColor(red: thirdViewRP/255, green: thirdViewGP/255, blue: thirdViewBP/255, alpha: 1)
            bluePointsLabel.text = String(NSString(format: "%0.2f", blueSlider.value))
            thirdBlueLabel = String(NSString(format: "%0.2f", blueSlider.value))
            
        default:
            return
        }
    
    }
    
}

