//
//  SecondViewController.swift
//  hw1.2
//
//  Created by Misha on 19.12.2020.
//

import UIKit


class SecondViewController: UIViewController {
    
    // MARK: - Properties
    
    var redPoints: CGFloat = 255
    var greenPoints: CGFloat = 255
    var bluePoints: CGFloat = 255

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(red: redPoints/255, green: greenPoints/255, blue: bluePoints/255, alpha: 1)

        showAlert()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        _ = segue.destination as? LoginViewController
        settingsVC?.delegate = self
        settingsVC?.viewRedPoints = redPoints
        settingsVC?.viewGreenPoints = greenPoints
        settingsVC?.viewBluePoints = bluePoints
    }
    
    
    @IBAction func settingsButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "settingsSegue", sender: nil)
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Tap \"🎨\" to change the color of this view.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)

        present(alert, animated: true, completion: nil)
    }

}

extension SecondViewController: SettingsViewControllerDelegate {
    func saveColor(redPoints: CGFloat, greenPoints: CGFloat, bluePoints: CGFloat) {
        view.backgroundColor = UIColor(red: redPoints/255, green: greenPoints/255, blue: bluePoints/255, alpha: 1)
        
        self.redPoints = redPoints
        self.greenPoints = greenPoints
        self.bluePoints = bluePoints
        
    }
}
