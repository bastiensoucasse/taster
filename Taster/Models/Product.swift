import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    var name: String
    var brand: String
    var variant: String
    var review: Review
    var pinned: Date?
    let added: Date
    
    init(id: Int, name: String, brand: String, variant: String = "", review: Review, pinned: Date? = nil, date: Date = Date.now) {
        self.id = id
        self.name = name
        self.brand = brand
        self.variant = variant
        self.review = review
        self.pinned = pinned
        self.added = date
    }
}
