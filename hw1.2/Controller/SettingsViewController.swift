//
//  ViewController.swift
//  hw1.2
//
//  Created by Misha on 02.12.2020.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func saveColor(redPoints: CGFloat, greenPoints: CGFloat, bluePoints: CGFloat)
}

class SettingsViewController: UIViewController {
    
    
    // MARK: - IB Outlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redPointsLabel: UILabel!
    @IBOutlet var greenPointsLabel: UILabel!
    @IBOutlet var bluePointsLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var resetButton: UIButton!
    
    
    // MARK: - Properties
    
    weak var delegate:SettingsViewControllerDelegate?
    
    var viewRedPoints: CGFloat = 255
    var viewGreenPoints: CGFloat = 255
    var viewBluePoints: CGFloat = 255

    
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redPointsLabel.text = String(Int(Float(viewRedPoints)))
        greenPointsLabel.text = String(Int(Float(viewGreenPoints)))
        bluePointsLabel.text = String(Int(Float(viewBluePoints)))
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255

        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255

        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        
        redSlider.value = Float(Int(viewRedPoints))
        greenSlider.value = Float(Int(viewGreenPoints))
        blueSlider.value = Float(Int(viewBluePoints))
    
        resetButton.layer.cornerRadius = 7
        colorView.layer.cornerRadius = 7
        
        colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue: viewBluePoints/255, alpha: 1)
        
    }
    

    
    // MARK: - IB Actions
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        
        viewRedPoints = CGFloat(redSlider.maximumValue)
        viewGreenPoints = CGFloat(greenSlider.maximumValue)
        viewBluePoints = CGFloat(blueSlider.maximumValue)

        redPointsLabel.text = String(Int(Float(viewRedPoints)))
        greenPointsLabel.text = String(Int(Float(viewGreenPoints)))
        bluePointsLabel.text = String(Int(Float(viewBluePoints)))

        redSlider.value = redSlider.maximumValue
        greenSlider.value = greenSlider.maximumValue
        blueSlider.value = blueSlider.maximumValue

        colorView.backgroundColor = UIColor(red: viewRedPoints/255, green: viewGreenPoints/255, blue: viewBluePoints/255, alpha: 1)
        
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.saveColor(redPoints: viewRedPoints, greenPoints: viewGreenPoints, bluePoints: viewBluePoints)
        dismiss(animated: true)
    }
    
    
    // MARK: - Sliders
    
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



