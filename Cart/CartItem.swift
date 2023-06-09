//
//  CartItem.swift
//  cart
//
//  Created by Purnasindhu on 17/03/1945 Saka.
//

import UIKit
struct CartItem: Codable, Equatable {
    let id : Int
    let title: String
    let price: Int
    var quantity: Int
    var image: String
    var total: Int
    var discountPercentage : Double
    var discountPrice : Double
}
