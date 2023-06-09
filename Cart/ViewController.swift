//
//  ViewController.swift
//  Cart
//
//  Created by Meghana on 06/06/23.
//

import UIKit
 
class ViewController: UIViewController, RegisterViewControllerDelegate, LoginViewControllerDelegate {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func registerButton(_ sender: Any) {
        registerButtonTapped()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        loginButtonTapped()
    }
//    let defaults = UserDefaults.standard
//    defaults.set(email, forKey: "email")
//    defaults.set(password, forKey: "password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "cart.jpg") {
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
//
//         let defaults = UserDefaults.standard
//
//            if let email = defaults.string(forKey: "email"),
//               let password = defaults.string(forKey: "password") {
//                // User is already logged in
//                // Navigate to Home Screen or perform necessary action
//            } else {
//                // User is not logged in
//                // Show login/signup screen
//            }

          
        }
    }
    
    func registerButtonTapped() {
        guard let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
            return
        }
        registerVC.delegate = self
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func loginButtonTapped() {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        loginVC.delegate = self
        loginVC.title = "LOGIN"
        navigationController?.pushViewController(loginVC, animated: true)
    }


}

