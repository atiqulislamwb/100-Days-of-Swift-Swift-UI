//
//  ContentView.swift
//  Accessibility_Practise
//
//  Created by Atiqul Islam on 2/3/24.
//

import SwiftUI
import Speech
import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}

struct ContentView: View {
    
    
        var pictures = [
            "ales-krivec-15949",
            "galina-n-189483",
            "kevin-horstmann-141705",
            "nicolas-tissot-335096"
        ]
    @State private var selectedPicture = Int.random(in: 0...3)
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    @State private var value = 10
    let locationFetcher = LocationFetcher()

    var body: some View {
        //        Button {
        //            selectedPicture = Int.random(in: 0...3)
        //        } label: {
        //            Image(pictures[selectedPicture])
        //                .resizable()
        //                .scaledToFit()
        //        }
        //                 .accessibilityLabel(labels[selectedPicture])
        //
        //                  .accessibilityAddTraits(.isButton)
        //                  .accessibilityRemoveTraits(.isImage)
//        VStack {
//            Text("Your score is")
//            Text("1000")
//                .font(.title)
//        }
//        .accessibilityElement(children: .combine)
//        .accessibilityLabel("Your score is 1000")
        
//        
//        VStack {
//                  Text("Value: \(value)")
//
//                  Button("Increment") {
//                      value += 1
//                  }
//
//                  Button("Decrement") {
//                      value -= 1
//                  }
//              }
//        .accessibilityElement()
//        .accessibilityLabel("Value")
//        .accessibilityValue(String(value))
//        .accessibilityAdjustableAction { direction in
//            switch direction {
//            case .increment:
//                value += 1
//            case .decrement:
//                value -= 1
//            default:
//                print("Not handled.")
//            }
//        }
        
//        Button("John Fitzgerald Kennedy") {
//            print("Button tapped")
//        }
//        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
        VStack {
                  Button("Start Tracking Location") {
                      locationFetcher.start()
                  }

                  Button("Read Location") {
                      if let location = locationFetcher.lastKnownLocation {
                          print("Your location is \(location)")
                      } else {
                          print("Your location is unknown")
                      }
                  }
              }
    }
}

#Preview {
    ContentView()
}
