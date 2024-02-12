//
//  ContentView.swift
//  Moonshot
//
//  Created by Atiqul Islam on 12/2/24.
//

import SwiftUI







struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
 

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
        
    
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                           // MissionView(mission: mission, astronauts: astronauts)
//                            Text("details view")
                            
                            ScrollView {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.top)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Mission Highlights")
                                            .font(.title.bold())
                                            .padding(.bottom, 5)
                                        
                                        Text(mission.description)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                
                                
                                .padding(.bottom)
                                
                                
//                                HStack {
//                                    ForEach(astronauts, id: \.role) { crewMember in
//                                        NavigationLink {
//                                            Text("Astronaut details")
//                                        } label: {
//                                            HStack {
//                                                Image(crewMember.astronaut.id)
//                                                    .resizable()
//                                                    .frame(width: 104, height: 72)
//                                                    .clipShape(.capsule)
//                                                    .overlay(
//                                                        Capsule()
//                                                            .strokeBorder(.white, lineWidth: 1)
//                                                    )
//                                                
//                                                VStack(alignment: .leading) {
//                                                    Text(crewMember.astronaut.name)
//                                                        .foregroundStyle(.white)
//                                                        .font(.headline)
//                                                    Text(crewMember.role)
//                                                        .foregroundStyle(.white.opacity(0.5))
//                                                }
//                                            }
//                                            .padding(.horizontal)
//                                        }
//                                    }
//                                }
                                
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding(10)
                                

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.launchDate ?? "N/A")
                                        .font(.caption)
                                        .foregroundStyle(.gray)

                                    
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }
                            .cornerRadius(10)
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            .padding()
                        }
                    }
                }
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
             
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
