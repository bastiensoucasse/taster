import Foundation

class Store: ObservableObject {
    @Published private var products: [Product]
    
    init(_ products: [Product] = []) {
        self.products = products
    }
    
    func push(_ product: Product) -> Int {
        products.append(product)
        return products.count - 1
    }
    
    func pop(_ index: Int) -> Product {
        let product = products[index]
        products.remove(at: index)
        return product
    }
    
    func getByIndex(_ index: Int) -> Product {
        return products[index]
    }
    
    func getByGrade(_ grade: Review.Grade, max: Int = -1) -> [Product] {
        let products = products.filter { product in
            product.review.grade == grade
        }.sorted { product0, product1 in
            product0.date > product1.date
        }
        
        if (max >= 0) {
            return Array(products.prefix(max))
        }
        
        return products
    }
    
    func countByGrade(_ grade: Review.Grade) -> Int {
        return getByGrade(grade).count
    }
    
    func getLatest(max: Int = -1) -> [Product] {
        let products = products.sorted { product0, product1 in
            product0.date > product1.date
        }
        
        if (max >= 0) {
            return Array(products.prefix(max))
        }
        
        return products
    }
    
    func getAll() -> [Product] {
        return getLatest()
    }
    
    func countAll() -> Int {
        return getAll().count
    }
    
    static let DEFAULT = Store([
        Drink(name: "White Mocha", brand: "Starbucks", temperature: .HOT, kind: .COFFEE, review: Review(.A, "Le café préféré de Iantsa."), date: Date.now.addingTimeInterval(-7 * 60 * 60)),
        Drink(name: "Caramel Macchiato", brand: "Starbucks", temperature: .HOT, kind: .COFFEE, review: .BASIC_A, date: Date.now.addingTimeInterval(-6 * 60 * 60)),
        Drink(name: "Iced White Mocha", brand: "Starbucks", temperature: .ICED, kind: .COFFEE, review: .BASIC_A, date: Date.now.addingTimeInterval(-5 * 60 * 60)),
        Drink(name: "Iced Caramel Macchiato", brand: "Starbucks", temperature: .ICED, kind: .COFFEE, review: .BASIC_B, date: Date.now.addingTimeInterval(-4 * 60 * 60)),
        Drink(name: "Iced Hibiscus Tea Lemonade", brand: "Starbucks", temperature: .ICED, kind: .DRINK, review: .BASIC_A, date: Date.now.addingTimeInterval(-3 * 60 * 60)),
        Drink(name: "Cool Lime Refresha", brand: "Starbucks", temperature: .ICED, kind: .DRINK, review: .BASIC_C, date: Date.now.addingTimeInterval(-2 * 60 * 60)),
        Drink(name: "Salted Caramel Cream Cold Brew", brand: "Starbucks", temperature: .ICED, kind: .COFFEE, review: .BASIC_D, date: Date.now.addingTimeInterval(-1 * 60 * 60))
    ])
}
