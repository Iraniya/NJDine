//
//  CheckoutView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI

enum PickupTime: String {
    case now = "Now"
    case tonight = "Tonight"
    case tomorrowMorning = "Tomorrow Morning"
}

struct CheckoutView: View {
    let paymentTypes = ["Cash", "Credit Card", "Reward Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    let pickupTimes: [PickupTime] = [.now, .tonight, .tomorrowMorning]
    
    @EnvironmentObject var order: Order
    @State private var paymaentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var pickupTime: PickupTime = .now
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymaentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your id",text: $loyaltyNumber)
                }
            }
            
            Section("Pickeup time") {
                Picker("times: ", selection: $pickupTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            //add button here
        } message: {
            Text("Your total was \(totalPrice) - thank you!")
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
