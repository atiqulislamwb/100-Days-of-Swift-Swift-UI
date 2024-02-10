//
//  ContentView.swift
//  Animation
//
//  Created by Atiqul Islam on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    let letters = Array("Hello SwiftUI")
    @State private var isShowingRed = false

    var body: some View {
//        print(animationAmount )
//        return VStack {
//            //            Stepper("Scale amount", value: $animationAmount.animation(
//            //                .easeInOut(duration: 1)
//            //                    .repeatCount(3, autoreverses: true)
//            //            ), in: 1...10)
//            //                      Spacer()
//
//            //            Button("Tap Me") {
//            //                withAnimation() {
//            //                    animationAmount += 360
//            //                }
//            //                     }
//            //                     .padding(40)
//            //                     .background(.red)
//            //                     .foregroundStyle(.white)
//            //                     .clipShape(Circle())
//            //                     .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//            //
//            //
//            //
//            //        }
//
//            Button("Tap Me") {
//                enabled.toggle()
//            }
//            .frame(width: 200, height: 200)
//            .background( enabled ? .red : .blue)
//            .foregroundStyle(.white)
//            .animation(.default, value: enabled)
//            .cornerRadius(enabled ? 60 : 0)
//            .animation(.easeInOut, value: enabled)
//        }
//
//        .padding()
        
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//                  .frame(width: 300, height: 200)
//                  .cornerRadius(30)
//                  .offset(dragAmount)
//                  .gesture(
//                      DragGesture()
//                        .onChanged{dragAmount = $0.translation}
//                        .onEnded { _ in
//                            withAnimation(.default) {
//                                dragAmount = .zero
//                            }
//                        }
//
//                  )
//                  .animation(.default, value: dragAmount)
        
//        HStack(spacing: 0) {
//                ForEach(0..<letters.count, id: \.self) { num in
//                    Text(String(letters[num]))
//                        .padding(5)
//                        .font(.title)
//                        .background(enabled ? .blue : .red)
//                        .offset(dragAmount)
//                        .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//                }
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//
//
//
        VStack {
                   Button("Tap Me") {
                       withAnimation {
                           isShowingRed.toggle()
                       }
                   }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
               }
              
                 
          }
        
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
