import SwiftUI

struct BrowseView: View {
    @StateObject var store: Store
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Review.Grade.all(), id: \.self) { grade in
                    if (store.countByGrade(grade) > 0) {
                        Section(grade.rawValue) {
                            ForEach(store.getByGrade(grade, max: 5)) { product in
                                NavigationLink(destination: DetailsView(product: product)) {
                                    ProductRow(product: product)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse")
            .toolbar {
                NavigationLink(destination: AddProductView(store: store)) {
                    Text("Add Product")
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
