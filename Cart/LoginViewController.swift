//
//  LoginViewController.swift
//  Cart
//
//  Created by Meghana on 06/06/23.
//

import UIKit
import Firebase

protocol LoginViewControllerDelegate: AnyObject {
    
}

class LoginViewController: UIViewController, HomeViewControllerDelegate {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    weak var delegate: LoginViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let a = error {
                self.showAlert(message: "Invalid email or password!")
            }
            else {
                guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
                    return
                }
                homeVC.delegate = self
//                self.navigationController?.pushViewController(homeVC, animated: true)
                self.present(homeVC, animated: true, completion: nil)
            }
        }
        
    }
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
}
