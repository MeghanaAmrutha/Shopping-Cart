//
//  AcknowledgementViewController.swift
//  cart
//
//  Created by Purnasindhu on 18/03/1945 Saka.
//

import UIKit
protocol AcknowledgementViewControllerDelegate: AnyObject{
    
}

class AcknowledgementViewController: UIViewController {
    
    weak var delegate: AcknowledgementViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ContinueAction(_ sender: Any) {
        if let homeViewController = navigationController?.viewControllers.filter({ $0 is HomeViewController }).first {
            navigationController?.popToViewController(homeViewController, animated: true)
        }
        
    }
}
