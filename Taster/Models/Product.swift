import Foundation

class Product: Identifiable {
    let name: String
    let brand: String
    let review: Review
    let date: Date
    
    init(name: String, brand: String, review: Review, date: Date = Date.now) {
        self.name = name
        self.brand = brand
        self.review = review
        self.date = date
    }
}
