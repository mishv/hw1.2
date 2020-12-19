//
//  ViewController.swift
//  hw1.2
//
//  Created by Misha on 02.12.2020.
//

import UIKit

enum Pointer {
    case first, second, third
}

class SettingsViewController: UIViewController {
    
    
    // MARK: - IB Outlets
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var thirdView: UIView!
    
    @IBOutlet var redPointsLabel: UILabel!
    @IBOutlet var greenPointsLabel: UILabel!
    @IBOutlet var bluePointsLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var firstLabelPointer: UILabel!
    @IBOutlet var secondLabelPointer: UILabel!
    @IBOutlet var thirdLabelPointer: UILabel!
    
    
    
    // MARK: - Public Properties
    var pointer = Pointer.first
    
    let lightIsOn: CGFloat = 1
    let lightIsOff: CGFloat = 0.2
    
    var currentView: UIView?
    
    // Data Storage
    // RP - Red Points, GP - green points, BP - Blue Points
    var firstViewRP: CGFloat = 0
    var firstViewGP: CGFloat = 0
    var firstViewBP: CGFloat = 0
    
    var secondViewRP: CGFloat = 0
    var secondViewGP: CGFloat = 0
    var secondViewBP: CGFloat = 0
    
    var thirdViewRP: CGFloat = 0
    var thirdViewGP: CGFloat = 0
    var thirdViewBP: CGFloat = 0
    
    
    var firstRedLabel: String = "0"
    var firstGreenLabel: String = "0"
    var firstBlueLabel: String = "0"
    
    var secondRedLabel: String = "0"
    var secondGreenLabel: String = "0"
    var secondBlueLabel: String = "0"
    
    var thirdRedLabel: String = "0"
    var thirdGreenLabel: String = "0"
    var thirdBlueLabel: String = "0"
    
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.isEnabled = false
        greenSlider.isEnabled = false
        blueSlider.isEnabled = false
        
        firstLabelPointer.isHidden = true
        secondLabelPointer.isHidden = true
        thirdLabelPointer.isHidden = true
        
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 7
        
        resetButton.layer.cornerRadius = 7
        resetButton.isEnabled = false
        resetButton.alpha = lightIsOff
        
        firstView.backgroundColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1)
        firstView.alpha = lightIsOff
        
        secondView.backgroundColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1)
        secondView.alpha = lightIsOff
        
        thirdView.backgroundColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1)
        thirdView.alpha = lightIsOff
        
        
        
        
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
        firstView.layer.cornerRadius = firstView.frame.width / 2
        secondView.layer.cornerRadius = secondView.frame.width / 2
        thirdView.layer.cornerRadius = thirdView.frame.width / 2
        
    }
    
    // MARK: - IB Actions
    @IBAction func startButtonPressed() {
        startButton.setTitle("Next", for: .normal)
        
        resetButton.isEnabled = true
        resetButton.alpha = lightIsOn
        
        redSlider.isEnabled = true
        greenSlider.isEnabled = true
        blueSlider.isEnabled = true
    
        switch pointer {
        case .first:
            thirdView.alpha = lightIsOff
            firstView.alpha = lightIsOn
            
            thirdLabelPointer.isHidden = true
            firstLabelPointer.isHidden = false
            
            pointer = .second
            currentView = firstView
            
            redSlider.value = Float(firstViewRP)
            greenSlider.value = Float(firstViewGP)
            blueSlider.value = Float(firstViewBP)
            
            redPointsLabel.text = firstRedLabel
            greenPointsLabel.text = firstGreenLabel
            bluePointsLabel.text = firstBlueLabel

        case .second:
            firstView.alpha = lightIsOff
            secondView.alpha = lightIsOn
            
            firstLabelPointer.isHidden = true
            secondLabelPointer.isHidden = false
            
            
            pointer = .third
            currentView = secondView
            
            redSlider.value = Float(secondViewRP)
            greenSlider.value = Float(secondViewGP)
            blueSlider.value = Float(secondViewBP)
            
            redPointsLabel.text = secondRedLabel
            greenPointsLabel.text = secondGreenLabel
            bluePointsLabel.text = secondBlueLabel
            
        case .third:
            secondView.alpha = lightIsOff
            thirdView.alpha = lightIsOn
            
            secondLabelPointer.isHidden = true
            thirdLabelPointer.isHidden = false
            
            pointer = .first
            currentView = thirdView
            
            redSlider.value = Float(thirdViewRP)
            greenSlider.value = Float(thirdViewGP)
            blueSlider.value = Float(thirdViewBP)
            
            redPointsLabel.text = thirdRedLabel
            greenPointsLabel.text = thirdGreenLabel
            bluePointsLabel.text = thirdBlueLabel
            
        }
        
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        pointer = Pointer.first
        currentView = nil

        firstViewRP = 0
        firstViewGP = 0
        firstViewBP = 0

        secondViewRP = 0
        secondViewGP = 0
        secondViewBP = 0

        thirdViewRP = 0
        thirdViewGP = 0
        thirdViewBP = 0

        firstRedLabel = "0"
        firstGreenLabel = "0"
        firstBlueLabel = "0"

        secondRedLabel = "0"
        secondGreenLabel = "0"
        secondBlueLabel = "0"

        thirdRedLabel = "0"
        thirdGreenLabel = "0"
        thirdBlueLabel = "0"
        
        firstLabelPointer.isHidden = true
        secondLabelPointer.isHidden = true
        thirdLabelPointer.isHidden = true
        
        redPointsLabel.text = "0"
        greenPointsLabel.text = "0"
        bluePointsLabel.text = "0"
        
        redSlider.value = redSlider.minimumValue
        greenSlider.value = greenSlider.minimumValue
        blueSlider.value = blueSlider.minimumValue
        
        redSlider.isEnabled = false
        greenSlider.isEnabled = false
        blueSlider.isEnabled = false

        firstView.backgroundColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1)
        firstView.alpha = lightIsOff

        secondView.backgroundColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1)
        secondView.alpha = lightIsOff

        thirdView.backgroundColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1)
        thirdView.alpha = lightIsOff
        
        startButton.setTitle("Start", for: .normal)

        resetButton.alpha = lightIsOff
        resetButton.isEnabled = false

    }
    
    
    @IBAction func redSliderAction(_ sender: Any) {
        
        switch currentView {
        case firstView:
            firstViewRP = CGFloat(redSlider.value)
            currentView?.backgroundColor = UIColor(red: firstViewRP/255, green: firstViewGP/255, blue: firstViewBP/255, alpha: 1)
            redPointsLabel.text = String(Int(redSlider.value))
            firstRedLabel = String(Int(redSlider.value))
            
        case secondView:
            secondViewRP = CGFloat(redSlider.value)
            currentView?.backgroundColor = UIColor(red: secondViewRP/255, green: secondViewGP/255, blue: secondViewBP/255, alpha: 1)
            redPointsLabel.text = String(Int(redSlider.value))
            secondRedLabel = String(Int(redSlider.value))
            
        case thirdView:
            thirdViewRP = CGFloat(redSlider.value)
            currentView?.backgroundColor = UIColor(red: thirdViewRP/255, green: thirdViewGP/255, blue: thirdViewBP/255, alpha: 1)
            redPointsLabel.text = String(Int(redSlider.value))
            thirdRedLabel = String(Int(redSlider.value))
        default:
            return
        }
    
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {

        switch currentView {
        case firstView:
            firstViewGP = CGFloat(greenSlider.value)
            currentView?.backgroundColor = UIColor(red: firstViewRP/255, green: firstViewGP/255, blue: firstViewBP/255, alpha: 1)
            greenPointsLabel.text = String(Int(greenSlider.value))
            firstGreenLabel = String(Int(greenSlider.value))
            
        case secondView:
            secondViewGP = CGFloat(greenSlider.value)
            currentView?.backgroundColor = UIColor(red: secondViewRP/255, green: secondViewGP/255, blue: secondViewBP/255, alpha: 1)
            greenPointsLabel.text = String(Int(greenSlider.value))
            secondGreenLabel = String(Int(greenSlider.value))
            
        case thirdView:
            thirdViewGP = CGFloat(greenSlider.value)
            currentView?.backgroundColor = UIColor(red: thirdViewRP/255, green: thirdViewGP/255, blue: thirdViewBP/255, alpha: 1)
            greenPointsLabel.text = String(Int(greenSlider.value))
            thirdGreenLabel = String(Int(greenSlider.value))
        default:
            return
        }
        
        
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {

        switch currentView {
        case firstView:
            firstViewBP = CGFloat(blueSlider.value)
            currentView?.backgroundColor = UIColor(red: firstViewRP/255, green: firstViewGP/255, blue:  firstViewBP/255, alpha: 1)
            bluePointsLabel.text = String(Int(blueSlider.value))
            firstBlueLabel = String(Int(blueSlider.value))
            
        case secondView:
            secondViewBP = CGFloat(blueSlider.value)
            currentView?.backgroundColor = UIColor(red: secondViewRP/255, green: secondViewGP/255, blue:  secondViewBP/255, alpha: 1)
            bluePointsLabel.text = String(Int(blueSlider.value))
            secondBlueLabel = String(Int(blueSlider.value))
            
        case thirdView:
            thirdViewBP = CGFloat(blueSlider.value)
            currentView?.backgroundColor = UIColor(red: thirdViewRP/255, green: thirdViewGP/255, blue: thirdViewBP/255, alpha: 1)
            bluePointsLabel.text = String(Int(blueSlider.value))
            thirdBlueLabel = String(Int(blueSlider.value))
            
        default:
            return
        }
    
    }
    
}

