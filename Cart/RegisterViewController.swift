//
//  RegisterViewController.swift
//  Cart
//
//  Created by Meghana on 06/06/23.
//

import UIKit
import Firebase

protocol RegisterViewControllerDelegate: AnyObject {
    
}
class RegisterViewController: UIViewController, HomeViewControllerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    weak var delegate: RegisterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   

    @IBAction func registerButton(_ sender: UIButton) {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passTextField.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            firebaseResult, error in
            if let a = error {
                print("Error")
            }
            else {
                guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
                    return
                }
                homeVC.delegate = self
                homeVC.modalPresentationStyle = .fullScreen 
//                self.navigationController?.pushViewController(homeVC, animated: true)
                self.present(homeVC, animated: true, completion: nil)
            }
        }
}
}
