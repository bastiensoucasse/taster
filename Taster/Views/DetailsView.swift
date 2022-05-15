import SwiftUI

struct DetailsView: View {
    @StateObject var store: Store
    @State var product: Product
    
    @State var deleted: Bool = false
    
    var body: some View {
        Form {
            Section {
                TextField("Caramel Macchiato", text: $product.name)
            } header: {
                Text("Name")
            }
            
            Section {
                TextField("Starbucks", text: $product.brand)
            } header: {
                Text("Brand")
            }
            
            Section {
                TextField("Coco Milk", text: $product.variant)
            } header: {
                Text("Variant")
            }
            
            Section {
                Picker("Grade", selection: $product.review.grade) {
                    ForEach(Review.Grade.all(), id: \.self) { grade in
                        Text(grade.rawValue).tag(grade)
                    }
                }.pickerStyle(.menu)
                
                TextField("In my opinion…", text: $product.review.opinion)
            } header: {
                Text("Review")
            }
            
            Section {
                Button {
                    if (product.pinned != nil) {
                        product.pinned = nil
                    } else {
                        product.pinned = Date.now
                    }
                } label: {
                    HStack {
                        if (product.pinned != nil) {
                            Image(systemName: "pin.fill")
                            Text("Unpin")
                        } else {
                            Image(systemName: "pin")
                            Text("Pin")
                        }
                    }
                    .padding(.vertical, 6.0)
                }
                
                Button {
                    deleted = true
                    store.remove(product.id)
                } label: {
                    HStack {
                        Image(systemName: "trash")
                        Text("Delete")
                    }
                    .foregroundColor(.red)
                    .padding(.vertical, 6.0)
                }
            } footer: {
                Text("Added \(product.added.formatted(date: .long, time: .omitted)) at \(product.added.formatted(date: .omitted, time: .shortened)).")
            }
        }
        .onDisappear(perform: {
            if (!deleted) {
                store.remove(product.id)
                store.push(product)
            }
        })
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailsView(store: .DEFAULT, product: Store.DEFAULT.getById(0)!)
        }
    }
}
