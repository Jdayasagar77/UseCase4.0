//
//  Models.swift
//  UseCase-4
//
//  Created by J Dayasagar on 12/08/23.
//

import Foundation
import SwiftUI

// Model for Refrigerator
struct Refrigerator: Identifiable {
    
    let id = UUID()
    let modelNo: String
    let warrantyDuration: String
    let yearOfManufacture: Int
    let capacity: String
    let size: String
    let coolingTechnology: String
    let price: Double
    let specialOffer: String
    let category: String
}

// Sample data
let refrigerators: [Refrigerator] = [
    Refrigerator(modelNo: "ABC123", warrantyDuration: "1 year", yearOfManufacture: 2023, capacity: "300L", size: "Medium", coolingTechnology: "Frost-Free", price: 800.00, specialOffer: "Extra 10% off", category: "Refrigerators"),
    // ... Add more refrigerators
]

// Calculate final price including GST
func calculateFinalPrice(price: Double, city: String) -> Double {
    // Calculate GST based on city and add it to the price
    var gstPercentage = 0.18 // Assuming a GST rate of 18%
    if city == "Delhi" {
        gstPercentage = 0.12 // Different GST rate for Delhi
    }
    let gstAmount = price * gstPercentage
    return price + gstAmount
}

// Service and installation category
enum ServiceCategory: String {
    case basic = "Basic Installation"
    case premium = "Premium Installation"
}

// Dealer model
struct DealerModel {
    let name: String
    let rating: Double
    let contact: String
}

// Sample dealer data
let dealers: [DealerModel] = [
    DealerModel(name: "Dealer A", rating: 4.5, contact: "123-456-7890"),
// ... Add more dealers here
]
