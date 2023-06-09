////
////  HomeViewController.swift
////  cart
////
////  Created by Purnasindhu on 17/03/1945 Saka.
////
//

import UIKit
protocol  HomeViewControllerDelegate: AnyObject {
    
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ConfirmationViewControllerDelegate {
    func continueShoppingTapped() {
        
    }
    
    func didConfirmCartitems(_ cartItems: [CartItem]) {

    }
    
    weak var delegate: HomeViewControllerDelegate?
    @IBOutlet var confirm: UIButton!
    @IBOutlet var total: UILabel!
    @IBOutlet var tableView: UITableView!
    var cartItems: [CartItem] = []
    var cart: Cart = Cart()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.isNavigationBarHidden = true
        tableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        parseJSONFromFile()
        updateTotalPrice()

    }
    func updateTotalPrice() {
       let totalPrice = cartItems.reduce(0.0) { $0 + (Double($1.discountPrice) * Double($1.quantity)) }
           total.text = "Total: Rs. \(totalPrice)"
       }
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCellTableViewCell else {
            return UITableViewCell ()
        }
        
        let cartItem = cartItems[indexPath.row]
        cell.name.text = cartItem.title
        cell.price?.text = "Price: Rs.\(cartItem.price)"
        cell.quantity.text = "\(cartItem.quantity)";
        cell.discountPrice.text = "DiscountPrice: Rs. \(cartItem.discountPrice)"
        cell.discountPercentage.text = "DiscountPrecentage:\(cartItem.discountPercentage)%"
        cell.myimageView.image = UIImage(named: cartItem.image)
//        cell.id.text = "\(cartItem.id)"
        cell.plus.tag = indexPath.row
        cell.plus.addTarget(self, action: #selector(incrementQuantity(_:)), for: .touchUpInside)
        cell.minus.tag = indexPath.row
        cell.minus.addTarget(self, action: #selector(decrementQuantity(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
        
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//    }
    @objc func incrementQuantity(_ sender: UIButton) {
        let index = sender.tag
        cartItems[index].quantity += 1
        tableView.reloadData()
        updateTotalPrice()
        addToCart(cartItems[index])

    }
    
    @objc func decrementQuantity(_ sender: UIButton) {
        let index = sender.tag
        if cartItems[index].quantity > 0 {
            cartItems[index].quantity -= 1
            tableView.reloadData()
            updateTotalPrice()
            removeFromCart(cartItems[index])

        }
    }
    func addToCart(_ cartItem: CartItem) {
            cart.addItem(cartItem)
        }
        
        func removeFromCart(_ cartItem: CartItem) {
            cart.removeItem(cartItem)
        }
    @IBAction func confirmCartDetails(_ sender: UIButton) {
        let confirmationVC = storyboard?.instantiateViewController(identifier: "ConfirmationViewController") as? ConfirmationViewController
        confirmationVC?.delegate = self
//        confirmationVC?.title = "Shopping Bag"
        confirmationVC?.selectedCartItems = cart.getItems()
        navigationController?.pushViewController(confirmationVC!, animated: true)
    }
    
    func parseJSONFromFile() {
        guard let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            cartItems = try decoder.decode([CartItem].self, from: jsonData)
            tableView.reloadData()
        } catch {
            print("Error: \(error)")
        }
       
    }
    
   
}
