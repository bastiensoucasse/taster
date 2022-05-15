import SwiftUI

struct ListViewRec: View {
    @StateObject var store: Store
    
    let products: [Product]
    
    var body: some View {
        if (products.count > 0) {
            ForEach(products) { product in
                NavigationLink {
                    DetailsView(store: store, product: product)
                } label: {
                    ProductRow(product: product)
                }
            }
        }
    }
}

struct ListView: View {
    @StateObject var store: Store
    @State private var showingAddProductSheet = false
    
    var grade: Review.Grade? = nil
    var pinned: Bool = false
    
    var body: some View {
        List {
            if (pinned) {
                ListViewRec(store: store, products: store.getPinned())
            } else if (grade != nil) {
                ListViewRec(store: store, products: store.getByGrade(grade!))
            } else {
                ListViewRec(store: store, products: store.getAll())
            }
        }
        .navigationTitle(pinned ? "Pinned" : grade != nil ? grade!.rawValue : "All")
        .toolbar {
            Button {
                showingAddProductSheet.toggle()
            } label: {
                Text("Add")
            }
            .sheet(isPresented: $showingAddProductSheet) {
                AddProductView(store: store)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(store: .DEFAULT)
        }
    }
}
