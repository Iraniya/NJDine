//
//  CheckoutView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI

struct CheckoutView: View {
    @StateObject var checkoutViewModel: CheckoutViewModel
    @EnvironmentObject var order: Order
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $checkoutViewModel.paymentType) {
                    ForEach(checkoutViewModel.paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add loyalty card", isOn: $checkoutViewModel.addLoyaltyDetails.animation())
                if checkoutViewModel.addLoyaltyDetails {
                    TextField("Enter your id",text: $checkoutViewModel.loyaltyNumber)
                        .privacySensitive()
                }
            }
            
            Section("Pickeup time") {
                Picker("times: ", selection: $checkoutViewModel.pickupTime) {
                    ForEach(checkoutViewModel.pickupTimes, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $checkoutViewModel.tipAmount) {
                    ForEach(checkoutViewModel.tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(checkoutViewModel.totalPrice)") {
                Button("Confirm order") {
                    checkoutViewModel.showingPaymentAlert.toggle()
                }
            }
        }
        .alert("Order confirmed", isPresented: $checkoutViewModel.showingPaymentAlert) {
            //add button here
        } message: {
            Text("Your total was \(checkoutViewModel.totalPrice) - thank you!")
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let checkoutViewModel = CheckoutViewModel(Order())
    CheckoutView(checkoutViewModel: checkoutViewModel)
        .environmentObject(Order())
}
