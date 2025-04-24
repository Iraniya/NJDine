//
//  TrackingView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 24/04/25.
//

import SwiftUI
import MapKit

struct Loacation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct TrackingView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    let annotations = [
        Loacation(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        Loacation(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        Loacation(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        Loacation(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
       ]
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [.zoom], annotationItems: annotations) {
            //MapPin(coordinate: $0.coordinate)
            MapAnnotation(coordinate: $0.coordinate) {
                Circle()
                    .strokeBorder(.red, lineWidth: 4)
            }
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    TrackingView()
}
