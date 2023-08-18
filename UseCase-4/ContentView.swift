//
//  ContentView.swift
//  UseCase-4
//
//  Created by J Dayasagar on 12/08/23.
//
import SwiftUI



struct ContentView: View {
    let electricalProductCategories = [
        ElectricalProduct(name: "Refrigerator"),
        ElectricalProduct(name: "Washing Machine"),
        ElectricalProduct(name: "Air Conditioner"),
        ElectricalProduct(name: "Microwave"),
        ElectricalProduct(name: "Oven")
    ]
    
    @State private var selectedProduct: ElectricalProduct?
    
    var body: some View {
        
        NavigationView {
            List(electricalProductCategories) { product in
                NavigationLink {
                 RefrigeratorListView(refrigerators: Refrigerator.refrigerators)
                        .navigationTitle(product.name)
                } label: {
                    Text(product.name)
                }

            }.navigationTitle("Electrical Appliances")
        }
        
    }
}

struct RefrigeratorListView: View {
    let refrigerators: [Refrigerator]
    
    var body: some View {
        List(refrigerators) { refrigerator in
            NavigationLink(destination: RefrigeratorDetailView(refrigerator: refrigerator)) {
                Text(refrigerator.modelNo)
            }
        }
    }
}

struct RefrigeratorDetailView: View {
    let refrigerator: Refrigerator
    
    var body: some View {
        VStack {
            Text(refrigerator.modelNo)
                .font(.title)
            
            Text("Price: $\(refrigerator.price, specifier: "%.2f")")
            
            VStack(alignment: .leading) {
                Text("Special Offers:")
                    .font(.headline)
                ForEach(refrigerator.specialOffers) { offer in
                    Text(offer.offerDescription)
                }
            }
            
            DeliveryDetailsView(store: Store.stores[0])
        }
        .padding()
    }
}

struct DeliveryDetailsView: View {
    let store: Store
    var body: some View {
        VStack(alignment: .leading) {
            Text("Delivery Details:")
                .font(.headline)
            
            Text("Store: \(store.name)")
            Text("Location: \(store.location.city)")
            
            DealersListView(store: Store.stores[0]) // You can choose a store here
            
            PurchaseButtonView()
        }
    }
}

struct DealersListView: View {
    let store: Store
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dealers:")
                .font(.headline)
            ForEach(store.dealers.sorted(by: { $0.ratings > $1.ratings })) { dealer in
                Text(dealer.name)
                    .foregroundColor(.blue)
                Text("Ratings: \(dealer.ratings, specifier: "%.1f")")
                Text("Contact: \(dealer.contactDetails.phone)")
            }
        }
    }
}

struct PurchaseButtonView: View {
    var body: some View {
        NavigationLink(destination: PurchaseView()) {
            Text("Purchase")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

//struct PurchaseView: View {
//    var body: some View {
//        VStack {
//            Text("Final Price: $xxx.xx")
//                .font(.title)
//                .padding()
//
//            Text("Delivery Address:")
//                .font(.headline)
//            // Input fields for address
//
//            Text("Select Service Category:")
//                .font(.headline)
//            // Dropdown for service category
//
//            Text("Select Installation Category:")
//                .font(.headline)
//            // Dropdown for installation category
//
//            Button(action: {
//                // Complete purchase logic
//            }) {
//                Text("Complete Purchase")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .padding()
//    }
//}


struct PurchaseView: View {
    @State private var selectedServiceCategory: ServiceCategory?
    @State private var selectedInstallationCategory: InstallationCategory?
    @State private var isPurchaseComplete = false
    
    var body: some View {
        VStack {
            Text("Final Price: $xxx.xx")
                .font(.title)
                .padding()
            
            Text("Delivery Address:")
                .font(.headline)
            // Input fields for address
            
            Text("Select Service Category:")
                .font(.headline)
            Picker(selection: $selectedServiceCategory, label: Text("Service Category")) {
                ForEach(ServiceCategory.serviceCategories, id: \.name) { category in
                    Text(category.name)
                }
            }
            
            Text("Select Installation Category:")
                .font(.headline)
            Picker(selection: $selectedInstallationCategory, label: Text("Installation Category")) {
                ForEach(InstallationCategory.installationCategories, id: \.name) { category in
                    Text(category.name)
                }
            }
            
            Button(action: {
                // Simulate completing the purchase logic
                isPurchaseComplete = true
            }) {
                Text("Complete Purchase")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .alert(isPresented: $isPurchaseComplete) {
            Alert(
                title: Text("Purchase Complete"),
                message: Text("Your purchase is complete."),
                dismissButton: .default(Text("OK")) {
                    // Navigate back to the homepage
                    isPurchaseComplete = false
                }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
