//
//  ProductCellTableViewCell.swift
//  cart
//
//  Created by Purnasindhu on 18/03/1945 Saka.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {
    
    @IBOutlet var Viewcell: UIView!
    
    
    @IBOutlet var name: UILabel!
    @IBOutlet var myimageView: UIImageView!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var plus: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var discountPrice: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var discountPercentage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Viewcell.layer.cornerRadius = 15
//        let yourview = UIView(frame: CGRect(x: 0, y: 0,width: 50,height: 50))
//        yourview.backgroundColor = .red
//        yourview.layer.cornerRadius = 10
//        self.view.addSubview(yourview)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
