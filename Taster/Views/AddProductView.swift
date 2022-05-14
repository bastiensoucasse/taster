import SwiftUI

struct AddProductView: View {
    @StateObject var store: Store
    
    /// TODO: Implement a view dedicated to adding a product, a form containing:
    /// - The name.
    /// - The brand.
    /// - The grade.
    /// - The review.
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(store: .DEFAULT)
    }
}
