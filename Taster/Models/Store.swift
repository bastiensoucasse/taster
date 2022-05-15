import Foundation

class Store: ObservableObject {
    @Published var products: [Product]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "store") {
            if let decoded = try? JSONDecoder().decode([Product].self, from: data) {
                products = decoded
                return
            }
        }
        products = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(products) {
            UserDefaults.standard.set(encoded, forKey: "store")
        }
    }
    
    init(_ products: [Product]) {
        self.products = products
        save()
    }
    
    func push(_ product: Product) {
        products.append(product)
        save()
    }
    
    func getAvailableId() -> Int {
        var maxId: Int = .min
        for product in products {
            if (maxId < product.id) {
                maxId = product.id
            }
        }
        return maxId + 1
    }
    
    func getIndex(_ id: Int) -> Int {
        let index = products.firstIndex(where: { product in
            product.id == id
        }) ?? -1
        return index
    }
    
    func remove(_ id: Int) {
        let index = getIndex(id)
        if (index >= 0) {
            products.remove(at: index)
            save()
        }
    }
    
    func getById(_ id: Int) -> Product? {
        let index = getIndex(id)
        if (index >= 0) {
            return products[index]
        }
        return nil
    }
    
    func getPinned(max: Int = -1) -> [Product] {
        let products = products.filter { product in
            product.pinned != nil
        }.sorted { product0, product1 in
            product0.pinned! > product1.pinned!
        }
        
        if (max >= 0) {
            return Array(products.prefix(max))
        }
        
        return products
    }
    
    func countPinned() -> Int {
        return getPinned().count
    }
    
    func getByGrade(_ grade: Review.Grade, max: Int = -1) -> [Product] {
        let products = products.filter { product in
            product.review.grade == grade
        }.sorted { product0, product1 in
            product0.added > product1.added
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
            product0.added > product1.added
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
        Product(id: 6, name: "White Mocha", brand: "Starbucks", review: Review(.A, "Le café préféré de Iantsa (quand c’est pas raté)."), pinned: Date.now, date: Date.now.addingTimeInterval(-7 * 60 * 60)),
        Product(id: 5, name: "Caramel Macchiato", brand: "Starbucks", variant: "Oat Milk", review: .A, date: Date.now.addingTimeInterval(-6 * 60 * 60)),
        Product(id: 4, name: "Iced White Mocha", brand: "Starbucks", review: .A, date: Date.now.addingTimeInterval(-5 * 60 * 60)),
        Product(id: 3, name: "Iced Caramel Macchiato", brand: "Starbucks", review: .B, date: Date.now.addingTimeInterval(-4 * 60 * 60)),
        Product(id: 2, name: "Iced Hibiscus Tea Lemonade", brand: "Starbucks", review: .A, date: Date.now.addingTimeInterval(-3 * 60 * 60)),
        Product(id: 1, name: "Cool Lime Refresha", brand: "Starbucks", review: .C, date: Date.now.addingTimeInterval(-2 * 60 * 60)),
        Product(id: 0, name: "Salted Caramel Cream Cold Brew", brand: "Starbucks", review: .F, date: Date.now.addingTimeInterval(-1 * 60 * 60))
    ])
}
