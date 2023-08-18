import Foundation

struct ElectricalProduct: Identifiable {
    let id = UUID()
    let name: String
}

struct Refrigerator: Identifiable {
    let id = UUID()
    let category: String
    let companyName: String
    let modelNo: String
    let warrantyDuration: String
    let yearOfManufacture: String
    let capacity: String
    let size: String
    let coolingTechnology: String
    let price: Double
    let specialOffers: [SpecialOffer]
    static let refrigerators: [Refrigerator] = [ Refrigerator(
        category: "Double Door",
        companyName: "CoolTech Appliances",
        modelNo: "CT2000",
        warrantyDuration: "2 years",
        yearOfManufacture: "2023",
        capacity: "500 L",
        size: "70x180x80 cm",
        coolingTechnology: "Frost-Free",
        price: 899.99,
        specialOffers: [
            SpecialOffer(offerDescription: "Free delivery"),
            SpecialOffer(offerDescription: "10% discount on accessories")
        ]
    ), Refrigerator(
        category: "Single Door",
        companyName: "ChillMaster",
        modelNo: "CM150",
        warrantyDuration: "1 year",
        yearOfManufacture: "2023",
        capacity: "300 L",
        size: "60x150x70 cm",
        coolingTechnology: "Direct Cool",
        price: 499.99,
        specialOffers: [
            SpecialOffer(offerDescription: "Buy one, get one ice tray free")
        ]
    )
    ]

}

struct SpecialOffer: Identifiable {
    let id = UUID()
    let offerDescription: String
}

struct Store: Identifiable {
    let id = UUID()
    let name: String
    let location: Location
    let dealers: [Dealer]
    static let stores: [Store] = [Store(
        name: "CoolZone Appliances",
        location: Location(city: "New York", area: "Downtown"),
        dealers: [Dealer(
            name: "Appliance World",
            contactDetails: ContactDetails(phone: "123-456-7890", email: "info@applianceworld.com"),
            ratings: 4.5,
            services: ["Repair", "Maintenance"]
        ), Dealer(
            name: "Home Appliances Plus",
            contactDetails: ContactDetails(phone: "987-654-3210", email: "support@homeappliancesplus.com"),
            ratings: 4.2,
            services: ["Installation", "Warranty Support"]
        )]
    )]

}

struct Location {
    let city: String
    let area: String
}

struct Dealer: Identifiable {
    let id = UUID()
    let name: String
    let contactDetails: ContactDetails
    let ratings: Double
    let services: [String]
}

struct ContactDetails {
    let phone: String
    let email: String
}

struct City {
    let name: String
    let gstRate: Double
    static let cities: [City] = [City(name: "New York", gstRate: 8.75)]

}

struct ServiceCategory: Hashable {
    let name: String
    static let serviceCategories: [ServiceCategory] = [ServiceCategory(name: "Appliance Services")]

}

struct InstallationCategory: Hashable {
    let name: String
    static let installationCategories: [InstallationCategory] = [InstallationCategory(name: "Installation")]

}


