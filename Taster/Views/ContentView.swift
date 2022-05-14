import SwiftUI

struct ContentView: View {
    let store: Store = .DEFAULT
    
    var body: some View {
        TabView {
            OverviewView(store: store)
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Overview")
                }
            
            BrowseView(store: store)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            SearchView(store: store)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
