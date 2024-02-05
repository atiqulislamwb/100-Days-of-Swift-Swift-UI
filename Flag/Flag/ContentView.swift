//
//  ContentView.swift
//  Flag
//
//  Created by Atiqul Islam on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @State  var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State  var correctAnswer = Int.random(in: 0...2)
    @State  private var scoreTitle = ""
    @State  private var showingScore = false
    
    func flagTapped(_ number:Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo , .black], startPoint:.top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.title3)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }

                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .shadow(radius: 5)
                    }
                    
                    .alert( scoreTitle  ,isPresented: $showingScore){
                        Button("Ok", action: askQuestion)
                    } message: {
                        Text("Your score is ???")
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
