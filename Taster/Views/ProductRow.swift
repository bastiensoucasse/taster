import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(product.brand)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8.0)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product(name: "Caramel Macchiato", brand: "Starbucks", review: Review(.A, "Trop bon !")))
    }
}
