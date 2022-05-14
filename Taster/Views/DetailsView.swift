import SwiftUI

struct DetailsView: View {
    let product: Product
    
    /// TODO: Implement a view dedicated to the details of a product, a list containing:
    /// - The name.
    /// - The brand.
    /// - The grade.
    /// - The review.
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(product: Product(name: "Caramel Macchiato", brand: "Starbucks", review: Review(.A, "Trop bon !")))
    }
}
