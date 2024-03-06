//
//  CardView.swift
//  Flashzilla
//
//  Created by Atiqul Islam on 6/3/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var offset = CGSize.zero
    @State var isShowingAnswer = false
    var removal: (()-> Void)? = nil
    
    var body: some View {
        ZStack {
                  RoundedRectangle(cornerRadius: 25)
                      .fill(.white)
                      .shadow(radius: 5)

                  VStack {
                      Text(card.prompt)
                          .font(.largeTitle)
                          .foregroundStyle(.black)

                      Text(card.answer)
                          .font(.title)
                          .foregroundStyle(.secondary)
                  }
                  .padding(20)
                  .multilineTextAlignment(.center)
              }
              .frame(width: 350, height: 250)
              .rotationEffect(.degrees(offset.width / 5.0))
              .opacity(2 - Double(abs(offset.width / 50)))
              .offset(x: offset.width * 5)
              .gesture(
                  DragGesture()
                      .onChanged { gesture in
                          offset = gesture.translation
                      }
                      .onEnded { _ in
                          if abs(offset.width) > 100 {
                              removal?()
                          } else {
                              offset = .zero
                          }
                      }
              )
              .onTapGesture {
                  isShowingAnswer.toggle()
              }
    }
}

#Preview {
    CardView(card: .example)
}
