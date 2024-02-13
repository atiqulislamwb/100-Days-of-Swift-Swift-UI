//
//  ContentView.swift
//  NavigationSwift
//
//  Created by Atiqul Islam on 13/2/24.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}


struct ContentView: View {
//
//    @State private var pathStore = PathStore()
    @State private var title = "SwiftUI"

    var body: some View {
        
        //            NavigationStack {
        //                List(0..<1000) { i in
        //                    NavigationLink("Tap me \(i)", value:i ){
        //                        DetailView(number: i)
        //                    }
        //
        //                   }
        //            }
        
        
        //
        //        NavigationStack {
        //            List(0..<100) { i in
        //                NavigationLink("Select \(i)", value: i)
        //            }
        //            .navigationDestination(for: Int.self) { selection in
        //                   Text("You selected \(selection)")
        //               }
        //        }
        
        //        NavigationStack(path: $path){
        //            VStack{
        //                Button("Show 32") {
        //                    path=[32]
        //                }
        //                Button("Show 64") {
        //                    path.append(64)
        //                }
        //            }
        //        }
        //
        
//        NavigationStack(path : $path) {
//            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Select Number: \(i)", value: i)
//                }
//
//                ForEach(0..<5) { i in
//                    NavigationLink("Select String: \(i)", value: String(i))
//                }
//                .toolbar {
//                    Button("Push 556") {
//                        path.append(556)
//                    }
//
//                    Button("Push Hello") {
//                        path.append("Hello")
//                    }
//                }
//
//
//                .navigationDestination(for: Int.self){ selection in
//                    Text("You selected the number \(selection)")
//                }
//                .navigationDestination(for: String.self) { selection in
//                    Text("You selected the string \(selection)")
//                }
//            }
//        }
        
        
//        NavigationStack(path: $pathStore.path) {
//                 DetailView(number: 0)
//                     .navigationDestination(for: Int.self) { i in
//                         DetailView(number: i)
//                     }
//             }
        
        
//        NavigationStack {
//            List(0..<100) { i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue)
//            .toolbarColorScheme(.dark)
//            .toolbar(.hidden, for: .navigationBar)
//
//        }
        
        NavigationStack {
            Text("Hello, world!")
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Tap Me") {
                        // button action here
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//struct DetailView: View {
//    var number: Int
//
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//    }
//}



//class PathStore {
//    var path: NavigationPath {
//        didSet {
//            save()
//        }
//    }
//
//    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
//
//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//                path = NavigationPath(decoded)
//                return
//            }
//        }
//
//        // Still here? Start with an empty path.
//        path = NavigationPath()
//    }
//
//    func save() {
//        guard let representation = path.codable else { return }
//        do {
//
//            let data = try JSONEncoder().encode(representation)
//            try data.write(to: savePath)
//        } catch {
//            print("Failed to save navigation data")
//        }
//    }
//}
