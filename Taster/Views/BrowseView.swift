import SwiftUI

struct BrowseView: View {
    @StateObject var store: Store
    @State private var showingAddProductSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Review.Grade.all(), id: \.self) { grade in
                    if (store.countByGrade(grade) > 0) {
                        Section {
                            ForEach(store.getByGrade(grade, max: 5)) { product in
                                NavigationLink {
                                    DetailsView(store: store, product: product)
                                } label : {
                                    ProductRow(product: product)
                                }
                            }
                        } header: {
                            HStack {
                                HStack {
                                    Text(grade.rawValue)
                                }
                                
                                if (store.countByGrade(grade) > 5) {
                                    Spacer()
                                    
                                    NavigationLink {
                                        ListView(store: store, grade: grade)
                                    } label: {
                                        Text("See All")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse")
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

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(store: .DEFAULT)
    }
}
