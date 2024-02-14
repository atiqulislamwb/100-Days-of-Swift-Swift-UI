//
//  ContentView.swift
//  Cupcake
//
//  Created by Atiqul Islam on 14/2/24.
//

import SwiftUI
//import CoreHaptics

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Response: Codable {
    var results: [Result]
}

//@Observable
struct User: Codable {
    var name = "Taylor"
}




struct ContentView: View {
// @State private var results = [Result]()
//        private var appleUrl =  "https://itunes.apple.com/search?term=taylor+swift&entity=song"
//
//    func loadData() async {
//        guard let url = URL(string: appleUrl) else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        }
//        catch {
//            print("Invalid data")
//        }
//
//    }
    
    @State private var username = ""
    @State private var email = ""
//    @State private var counter = 0
//    @State private var engine: CHHapticEngine?
    
    
    @State private var order = Order()
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    //Api call -- it's so important
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
             print("Invalid Order")
            return
            
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
            
        } catch{
            print("Checkout failed: \(error.localizedDescription)")
        }
        
            
    }
    
    var body: some View {
        
//        List(results, id:\.trackId){ item in
//            VStack(alignment: .leading) {
//                           Text(item.trackName)
//                               .font(.headline)
//                           Text(item.collectionName)
//                       }
//        }
//        .task {
//            await loadData()
//        }
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            Color.red
//          }
//        .frame(width: 50, height: 50)
//
//
        
      
      
        
        
        
        
        NavigationStack {
            Form {
                
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices , id:\.self){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)" , value: $order.quantity, in: 2...20)
                }
                
                Section{
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation(.default))
                    
                    if(order.specialRequestEnabled){
                        Toggle("Add extra Foresting", isOn:$order.extraFrosting)
                        Toggle("Add extra Sprinkle", isOn:$order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        //Address View
                        Form {
                            Section {
                                TextField("Name", text: $order.name)
                                TextField("Street Address", text: $order.streetAddress)
                                TextField("City", text: $order.city)
                                TextField("Zip", text: $order.zip)
                            }
                            
                            Section {
                                NavigationLink("Check out") {
                                    //Checkout View
                                    ScrollView {
                                        VStack {
                                            AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(height: 233)
                                            
                                            Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                                                .font(.title)
                                            
                                            Button("Place Order"){
                                                Task {
                                                       await placeOrder()
                                                   }
                                              }
                                              .padding()
                                              .alert("Thank you!", isPresented: $showingConfirmation) {
                                                  Button("OK") { }
                                              } message: {
                                                  Text(confirmationMessage)
                                              }
                                        }
                                        .scrollBounceBehavior(.basedOnSize)
                                    }
                                    .navigationTitle("Check out")
                                    .navigationBarTitleDisplayMode(.inline)
                                }

                            }
                            .disabled(order.hasValidAddress == false)
                        }
                        .navigationTitle("Delivery details")
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                    
                }
                
            
                
            }
            .navigationTitle("Cupcake Corner")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
