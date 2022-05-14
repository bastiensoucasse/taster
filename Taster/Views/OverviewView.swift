import SwiftUI

struct OverviewView: View {
    @StateObject var store: Store
    
    var body: some View {
        NavigationView {
            List {
                if (store.countAll() > 0) {
                    Section("Latest") {
                        ForEach(store.getLatest(max: 5)) { product in
                            NavigationLink(destination: DetailsView(product: product)) {
                                ProductRow(product: product)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Overview")
            .toolbar {
                NavigationLink(destination: AddProductView(store: store)) {
                    Text("Add Product")
                }
            }
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(store: .DEFAULT)
    }
}
