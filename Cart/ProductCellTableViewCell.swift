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
        myimageView.layer.cornerRadius = myimageView.frame.height / 2
        myimageView.layer.masksToBounds = true
        myimageView.clipsToBounds = true
        myimageView.layer.borderWidth = 1
        Viewcell.layer.cornerRadius = 12
        plus.layer.cornerRadius = plus.frame.height / 2
        plus.layer.masksToBounds = true
        plus.clipsToBounds = true
        plus.layer.borderWidth = 0
        minus.layer.cornerRadius = minus.frame.height / 2
        minus.layer.masksToBounds = true
        minus.clipsToBounds = true
        minus.layer.borderWidth = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
