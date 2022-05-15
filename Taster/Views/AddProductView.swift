import SwiftUI

struct AddProductView: View {
    @StateObject var store: Store
    @State private var name: String = ""
    @State private var brand: String = ""
    @State private var variant: String = ""
    @State private var grade: Review.Grade = .A
    @State private var opinion: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Caramel Macchiato", text: $name)
                } header: {
                    Text("Name")
                }
                
                Section {
                    TextField("Starbucks", text: $brand)
                } header: {
                    Text("Brand")
                }
                
                Section {
                    TextField("Coco Milk", text: $variant)
                } header: {
                    Text("Variant")
                }
                
                Section {
                    Picker("Grade", selection: $grade) {
                        ForEach(Review.Grade.all(), id: \.self) { grade in
                            Text(grade.rawValue).tag(grade)
                        }
                    }.pickerStyle(.menu)
                    
                    TextField("In my opinion…", text: $opinion)
                } header: {
                    Text("Review")
                }
            }
            .navigationTitle("New Product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        store.push(Product(id: store.getAvailableId(), name: name, brand: brand, variant: variant, review: Review(grade, opinion)))
                        dismiss()
                    } label: {
                        Text("Add")
                            .fontWeight(.semibold)
                    }
                }
                
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(store: .DEFAULT)
    }
}
