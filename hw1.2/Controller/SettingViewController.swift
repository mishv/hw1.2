//
//  SettingViewController.swift
//  hw1.2
//
//  Created by Misha on 19.12.2020.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
        
        @IBOutlet var redPointsLabel: UILabel!
        @IBOutlet var greenPointsLabel: UILabel!
        @IBOutlet var bluePointsLabel: UILabel!
        
        @IBOutlet var redSlider: UISlider!
        @IBOutlet var greenSlider: UISlider!
        @IBOutlet var blueSlider: UISlider!
        
        @IBOutlet var resetButton: UIButton!

    // MARK: - Public Properties
        
        // Data Storage
        
        var viewRedPoints: CGFloat = 255
        var viewGreenPoints: CGFloat = 255
        var viewBluePoints: CGFloat = 255

        var firstRedLabel: String = "0"
        var firstGreenLabel: String = "0"
        var firstBlueLabel: String = "0"
        
        
        // MARK: - Life Cycle Methods
        override func viewDidLoad() {
            super.viewDidLoad()
            
            redSlider.value = 255
            greenSlider.value = 255
            blueSlider.value = 255
        
            resetButton.layer.cornerRadius = 7
            
            colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue: viewBluePoints/255, alpha: 1)
            
            
            
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
        
    //    override func viewWillLayoutSubviews() {
    //
    //
    //    }
        
        // MARK: - IB Actions
        

        @IBAction func resetButtonPressed(_ sender: Any) {
        
            viewRedPoints = 255
            viewGreenPoints = 255
            viewBluePoints = 255

            redPointsLabel.text = "255"
            greenPointsLabel.text = "255"
            bluePointsLabel.text = "255"

            redSlider.value = redSlider.maximumValue
            greenSlider.value = greenSlider.maximumValue
            blueSlider.value = blueSlider.maximumValue

            colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue: viewBluePoints/255, alpha: 1)
            
        }
        
        
        @IBAction func redSliderAction(_ sender: Any) {
            
            
                viewRedPoints = CGFloat(redSlider.value)
                colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue: viewBluePoints/255, alpha: 1)
                redPointsLabel.text = String(Int(redSlider.value))
                
                
            
        
        }
        
        @IBAction func greenSliderAction(_ sender: Any) {

            
                viewGreenPoints = CGFloat(greenSlider.value)
                colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue: viewBluePoints/255, alpha: 1)
                greenPointsLabel.text = String(Int(greenSlider.value))
   
            
        }
        
        @IBAction func blueSliderAction(_ sender: Any) {

            
                viewBluePoints = CGFloat(blueSlider.value)
                colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue:  viewBluePoints/255, alpha: 1)
                bluePointsLabel.text = String(Int(blueSlider.value))
                
        }
        
    }
