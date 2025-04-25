//
//  CheckoutViewModel.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 25/04/25.
//

import Foundation

enum PickupTime: String {
    case now = "Now"
    case tonight = "Tonight"
    case tomorrowMorning = "Tomorrow Morning"
}

class CheckoutViewModel: ObservableObject {
    @Published var order: Order
    @Published var showingPaymentAlert = false
    @Published var pickupTime: PickupTime = .now
    @Published var tipAmount = 15
    @Published var loyaltyNumber = ""
    @Published var paymentType = "Cash"
    @Published var addLoyaltyDetails = false
    
    init(_ order: Order) {
        self.order = order
    }
    
    let paymentTypes = ["Cash", "Credit Card", "Reward Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    let pickupTimes: [PickupTime] = [.now, .tonight, .tomorrowMorning]
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
}
