//
//  ContentView.swift
//  Flashzilla
//
//  Created by Atiqul Islam on 6/3/24.
//

import SwiftUI


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}


struct ContentView: View {

    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { i in
                        CardView(card: cards[i]) {
                            withAnimation{
                                removeCard(at: i)
                            }
                        }
                            .stacked(at: i, in: cards.count)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
