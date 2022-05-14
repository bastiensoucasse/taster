import Foundation

class Drink: Product {
    enum Temperature { case ICED, COLD, AMBIENT, HOT }
    enum Kind { case COFFEE, TEA, DRINK }
    
    let temperature: Temperature
    let kind: Kind
    
    init(name: String, brand: String, temperature: Temperature, kind: Kind, review: Review, date: Date = Date.now) {
        self.temperature = temperature
        self.kind = kind
        super.init(name: name, brand: brand, review: review, date: date)
    }
}
