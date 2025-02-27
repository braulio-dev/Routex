import SwiftUI

struct RouteListView: View {
    
    @StateObject private var viewModel = RouteViewModel()
    @State private var showRouteStartView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.routes) { route in
                    
                    NavigationLink(
                        destination: RouteView(route: route)
                    ) {
                        RouteRowView(route: route)
                    }
                }
            }
            .navigationTitle("Routes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showRouteStartView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showRouteStartView) {
                RouteStartView(showRouteStartView: $showRouteStartView)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    RouteListView()
}
