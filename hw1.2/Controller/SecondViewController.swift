//
//  SecondViewController.swift
//  hw1.2
//
//  Created by Misha on 19.12.2020.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        showAlert()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.delegate = self
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
    
//    @IBAction func unwindSegueToSecondVC(segue: UIStoryboardSegue) {
//
//    }
    

}

extension SecondViewController: SettingsViewControllerDelegate {
    func saveColor(redPoints: CGFloat, greenPoints: CGFloat, bluePoints: CGFloat) {
        view.backgroundColor = UIColor(red: redPoints, green: greenPoints, blue: bluePoints, alpha: 1)
        
    }
}
