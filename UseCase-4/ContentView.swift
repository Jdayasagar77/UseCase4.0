//
//  ContentView.swift
//  UseCase-4
//
//  Created by J Dayasagar on 12/08/23.
//
import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory: String? = nil
    @State private var selectedRefrigerator: Refrigerator? = nil
    @State private var selectedCity: String = ""
    @State private var dealers: [String] = []
    @State private var selectedDealer: String = ""
    @State private var showPaymentOptions: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if selectedCategory == nil {
                    Text("Select a category:")
                    // List of product categories
                    List {
                        ForEach(Set(refrigerators.map { $0.category }), id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                            }
                        }
                    }
                    
                } else if let category = selectedCategory {
                    Text("Select a refrigerator:")
                    // List of refrigerators in the selected category
                    List {
                        ForEach(refrigerators.filter { $0.category == category }) { refrigerator in
                            Button(action: {
                                selectedRefrigerator = refrigerator
                            }) {
                                Text(refrigerator.modelNo)
                            }
                        }
                    }
                    
                } else if let refrigerator = selectedRefrigerator {
                    Text("Refrigerator Details:")
                    // Display refrigerator details
                    // ...
                }
                
                Spacer()
                
                if !dealers.isEmpty {
                    Text("Select a dealer:")
                    // List of dealers
                    List(dealers, id: \.self) { dealer in
                        Button(action: {
                            selectedDealer = dealer
                        }) {
                            Text(dealer)
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {
                    showPaymentOptions = true
                }) {
                    Text("Proceed to Payment")
                }
            }
            .navigationBarTitle("Refrigerator Store")
        }
        .sheet(isPresented: $showPaymentOptions) {
            // Payment options and discounts
            // ...
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
