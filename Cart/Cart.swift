//
//  Cart.swift
//  cart
//
//  Created by Purnasindhu on 19/03/1945 Saka.
//
import Foundation
class Cart {
    private var items: [CartItem] = []
    
    func addItem(_ item: CartItem) {
        items.append(item)
    }
    
    func removeItem(_ item: CartItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func clear() {
        items.removeAll()
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + (Double($1.discountPrice) * Double($1.quantity)) }
    }
    
    func getItems() -> [CartItem] {
        return items
    }
}
