//
//  ContentView.swift
//  BucketList
//
//  Created by Atiqul Islam on 28/2/24.
//

import SwiftUI
import MapKit
import LocalAuthentication
//struct User: Identifiable {
//    let id = UUID()
//    var firstName: String
//    var lastName: String
//}
//
//enum LoadingState {
//    case loading, success, failed
//}
//
//struct LoadingView: View {
//    var body:some View{
//        Text("Loading")
//    }
//}
//
//struct SuccessView: View {
//    var body:some View{
//        Text("Success")
//    }
//}
//
//struct FailedView: View {
//    var body:some View{
//        Text("Failed")
//    }
//}

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
  //@State private var loadingState = LoadingState.loading
//@State private var position = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 23.1123, longitude: 89.1131), span:MKCoordinateSpan(
//            latitudeDelta: 1, longitudeDelta: 1
//            )
//        )
//    )
//    
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]
    
    @State private var isUnlocked = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
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
          VStack {
              if isUnlocked {
                  Text("Unlocked")
              } else {
                  Text("Locked")
              }
          }
          .onAppear(perform: authenticate)
      }
}

#Preview {
    ContentView()
}
