//
//  LoginViewController.swift
//  hw1.2
//
//  Created by Misha on 19.12.2020.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotUserButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    private let user = User.getUserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4.5
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            loginButtonTapped()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
   
    @IBAction func loginButtonTapped() {
        if userNameTF.text == user.login &&
            passwordTF.text == user.password {
        performSegue(withIdentifier: "logInSegue", sender: nil)
        } else {
            showAlert()
        }
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Access denied", message: "Wrong login or password.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)

        present(alert, animated: true, completion: nil)
    }
        
    
    @IBAction func namePromptTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "User name:", message: "artist", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func passPromptTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Password:", message: "creator", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let tabBarController = segue.destination as! SecondTabBarController
        //let dvc = tabBarController.viewControllers?.first as! WelcomeViewController
        //dvc.name = userNameTF.text ?? ""
        
        
        
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }
    
    
    
    


}

