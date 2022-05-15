import SwiftUI

struct SearchView: View {
    @StateObject var store: Store
    @State private var showingAddProductSheet = false
    
    var body: some View {
        NavigationView {
            List {
                /// TODO: Search.
            }
            .navigationTitle("Search")
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
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(store: .DEFAULT)
    }
}
