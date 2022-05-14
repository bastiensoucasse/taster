import SwiftUI

struct SearchView: View {
    @StateObject var store: Store
    
    var body: some View {
        NavigationView {
            List {
                /// TODO: Overview.
            }
            .navigationTitle("Search")
            .toolbar {
                NavigationLink(destination: AddProductView(store: store)) {
                    Text("Add Product")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(store: .DEFAULT)
    }
}
