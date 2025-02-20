//
//  RouteRowView.swift
//  Proyecto1
//
//  Created by CETYS Universidad  on 19/02/25.
//

import SwiftUI

struct RouteRowView : View {
    let route: Route
    
    var body : some View {
        VStack {
            Text(route.title)
            
            if let image = route.image {
                Image(uiImage: image)
            }
        }
    }
}

#Preview {
    RouteRowView(route: Route(
        title: "Titulo",
        timeStart: Date(),
        timeEnd: Date(),
        locationStart: Location(latitude: 0, longitude: 0),
        locationEnd: Location(latitude: 0, longitude: 100),
        image: nil
    ))
}
