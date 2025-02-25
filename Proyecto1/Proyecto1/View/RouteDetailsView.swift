import SwiftUI
import MapKit

struct RouteDetailsView: View {
    
    var startLocation: Location?
    var endLocation: Location?
    var timeStart: Date?
    var timeEnd: Date?
    
    @EnvironmentObject private var viewModel: RouteViewModel
    @State private var title: String = ""
    @State private var image: UIImage?
    @State private var isImagePickerPresented = false
    
    private var distance: Double {
        guard let start = startLocation, let end = endLocation else { return 0 }
        let startCoordinate = CLLocation(latitude: start.latitude, longitude: start.longitude)
        let endCoordinate = CLLocation(latitude: end.latitude, longitude: end.longitude)
        return startCoordinate.distance(from: endCoordinate) / 1000 // km
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(uiImage: image ?? UIImage(systemName: "camera")!)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    isImagePickerPresented.toggle()
                }
            
            TextField("Enter route title", text: $title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
            
            Text("Distance: \(distance, specifier: "%.2f") km")
                .font(.title2)
                .fontWeight(.bold)
            
            Button(action: {
                createRoute()
            }) {
                Text("Create Route")
                    .padding()
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 20,
                            style: .continuous
                        )
                        .fill(.blue)
                        .frame(width: 300)
                    )
            }
        }
        .navigationTitle("Route Details")
        .padding()
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $image)
        }
    }
    
    private func createRoute() {
        let newRoute = Route(
            title: title,
            timeStart: timeStart ?? Date(),
            timeEnd: timeEnd ?? Date(),
            locationStart: startLocation ?? Location(latitude: 0, longitude: 0),
            locationEnd: endLocation ?? Location(latitude: 0, longitude: 0),
            distance: distance,
            image: image
        )
        
        viewModel.routes.append(newRoute)
    }
}

#Preview {
    RouteDetailsView(
        startLocation: Location(latitude: 37.7749, longitude: -122.4194),
        endLocation: Location(latitude: 37.76, longitude: -122.415),
        timeStart: Date(),
        timeEnd: Date().addingTimeInterval(14 * 60)
    )
}
