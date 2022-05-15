import SwiftUI

struct OverviewView: View {
    @StateObject var store: Store
    @State private var showingAddProductSheet = false
    
    var body: some View {
        NavigationView {
            List {
                if (store.countAll() > 0) {
                    Section {
                        ForEach(store.getLatest(max: 5).filter({ product in
                            product.pinned == nil
                        })) { product in
                            NavigationLink {
                                DetailsView(store: store, product: product)
                            } label: {
                                ProductRow(product: product)
                            }
                        }
                    } header: {
                        HStack {
                            HStack {
                                Image(systemName: "clock")
                                Text("Latest")
                            }
                            
                            if (store.countAll() > 5) {
                                Spacer()
                                
                                NavigationLink {
                                    ListView(store: store)
                                } label: {
                                    Text("See All")
                                }
                            }
                        }
                    }
                    
                    if (store.countPinned() > 0) {
                        Section {
                            ForEach(store.getPinned(max: 5)) { product in
                                NavigationLink {
                                    DetailsView(store: store, product: product)
                                } label: {
                                    ProductRow(product: product)
                                }
                            }
                        } header: {
                            HStack {
                                HStack {
                                    Image(systemName: "pin")
                                    Text("Pinned")
                                }
                                
                                if (store.countPinned() > 5) {
                                    Spacer()
                                    
                                    NavigationLink {
                                        ListView(store: store, pinned: true)
                                    } label: {
                                        Text("See All")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Overview")
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

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(store: .DEFAULT)
    }
}
