//
//  HomeViewController.swift
//  Cart
//
//  Created by Meghana on 07/06/23.
//

import UIKit
protocol HomeViewControllerDelegate: AnyObject {
    
}

class HomeViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
