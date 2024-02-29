//
//  ContentView.swift
//  BucketList
//
//  Created by Atiqul Islam on 28/2/24.
//

import SwiftUI
import MapKit
import LocalAuthentication




struct ContentView: View {
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 89.77, longitude: 89.444),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
  @State private var isUnlocked = false
    
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                if success {
                    isUnlocked = true
                } else {
                isUnlocked = false
                }
            }
        } else {
            // no biometrics
        }
    }
    
    
    
      var body: some View {
          if isUnlocked {
              MapReader { proxy in
                  Map(initialPosition: startPosition){
                      
                      ForEach(locations) { location in
                          Annotation(location.name, coordinate: location.coordinate) {
                              Image(systemName: "star.circle")
                                  .resizable()
                                  .foregroundStyle(.red)
                                  .frame(width: 44, height: 44)
                                  .background(.white)
                                  .clipShape(.circle)
                                  .onLongPressGesture{
                                      selectedPlace = location
                                  }
                          }
                      }
                  }
                      .onTapGesture { position in
                          if let coordinate = proxy.convert(position, from: .local) {
                              let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                              locations.append(newLocation)
                          }
                      }
                      .sheet(item: $selectedPlace) { place in
                          EditView(location: place) { newLocation in
                              if let index = locations.firstIndex(of: place) {
                                  locations[index] = newLocation
                              }
                          }
                      }
              }
          }else{
              Button("Unlock Places", action: authenticate)
                  .padding()
                  .background(.blue)
                  .foregroundStyle(.white)
                  .clipShape(.capsule)
          }
      }
}

#Preview {
    ContentView()
}
