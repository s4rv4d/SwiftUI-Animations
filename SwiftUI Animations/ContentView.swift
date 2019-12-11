//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by Sarvad shetty on 12/8/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationValue = 0.0
    
    var body: some View {
        Button("Tap me"){
            //do something
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationValue += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationValue), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//struct ContentView: View {
//
//    @State private var animationValue: CGFloat = 1
//
//    var body: some View {
//        Button("Hello, World!") {
////            self.animationValue += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
////        .scaleEffect(animationValue)
////        .blur(radius: (animationValue - 1) * 3)
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//            .scaleEffect(animationValue)
//            .opacity(Double(2 - animationValue))
//            .animation(
//                Animation.easeInOut(duration: 2)
//    //                .repeatCount(3, autoreverses: true)
//                    .repeatForever(autoreverses: false)
//                    )
//        )
//
//            .onAppear {
//                self.animationValue = 2
//        }
//
//    }
//}

//
//print(animationValue)
//        return VStack {
//            Stepper("Scale amount:",value:$animationValue.animation(), in: 1 ... 10 )
//            Spacer()
//            Button("Tap Me") {
//                self.animationValue += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationValue)
////            .animation(.default)
//        }
