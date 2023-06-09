//
//  ConfirmationViewController.swift
//  cart
//
//  Created by Purnasindhu on 17/03/1945 Saka.
//

//import UIKit
//protocol ConfirmationViewControllerDelegate: AnyObject{
//    func didConfirmCartitems(_ cartItems: [CartItem])
//}
//
//class ConfirmationViewController: UIViewController {
//
//    weak var delegate: ConfirmationViewControllerDelegate?
//    var cartItems: [CartItem] = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
import UIKit
protocol ConfirmationViewControllerDelegate: AnyObject{
    func didConfirmCartitems(_ cartItems: [CartItem])
}
class ConfirmationViewController: UIViewController, AcknowledgementViewControllerDelegate {
    weak var delegate: ConfirmationViewControllerDelegate?
    var selectedCartItems: [CartItem] = []
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var confirmButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
    }
}
extension ConfirmationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCellTableViewCell else {
            return UITableViewCell()
        }
        
        let cartItem = selectedCartItems[indexPath.row]
        cell.name.text = cartItem.title
        cell.price?.text = "Price: Rs.\(cartItem.price)"
        cell.quantity.text = "\(cartItem.quantity)";
        cell.discountPrice.text = "DiscountPrice: Rs. \(cartItem.discountPrice)"
        cell.discountPercentage.text = "DiscountPrecentage: \(cartItem.discountPercentage)%"
        cell.myimageView.image = UIImage(named: cartItem.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    @IBAction func Confirm(_ sender: UIButton) {
        let AcknowledgementVC = storyboard?.instantiateViewController(identifier: "AcknowledgementViewController") as? AcknowledgementViewController
        AcknowledgementVC?.delegate = self
//        AcknowledgementVC?.selectedCartItems = selectedCartItems
        navigationController?.pushViewController(AcknowledgementVC!, animated: true)
    }
}
