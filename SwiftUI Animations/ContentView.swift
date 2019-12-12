//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by Sarvad shetty on 12/8/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import SwiftUI

//creating custom viewmodifier for custom rotation
struct CornerRotationModifier: ViewModifier {
    let amount: Double
    let anchorPoint: UnitPoint
    
    //VM func
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchorPoint)
        .clipped()
    }
}

extension AnyTransition {
    static var pivot : AnyTransition {
        .modifier(active: CornerRotationModifier(amount: -90, anchorPoint: .topLeading), identity: CornerRotationModifier(amount: 0, anchorPoint: .topLeading))
    }
}

struct ContentView: View {
    
    @State private var animationValue = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello World")
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                //do nothing
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
//                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
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

//Button("Tap me"){
//    //do something
//    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//        self.animationValue += 360
//    }
//}
//.padding(50)
//.background(Color.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.rotation3DEffect(.degrees(animationValue), axis: (x: 0, y: 1, z: 0))

//Button("Tap me") {
//    //do something
//    self.enabled.toggle()
//}
//.frame(width: 200, height: 200)
//.background(enabled ? Color.blue : Color.red)
//.animation(.default)
//.foregroundColor(.white)
//.clipShape(RoundedRectangle(cornerRadius: self.enabled ? 60 : 0))
//.animation(.interpolatingSpring(stiffness: 10, damping: 1))

// LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 200, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//        .gesture(
//            DragGesture()
//                .onChanged{
//                    self.dragAmount = $0.translation
//            }
//            .onEnded { _ in
//                withAnimation(.spring()) {
//                    self.dragAmount = .zero
//                }
//            }
//        )
////            .animation(.spring())

//
//HStack(spacing: 0) {
//    ForEach(0..<letters.count) { num in
//        Text(String(self.letters[num]))
//            .padding(5)
//            .font(.title)
//            .background(self.enabled ? Color.blue : Color.red)
//            .offset(self.dragAmount)
//            .animation(Animation.default.delay(Double(num) / 20))
//    }
//}
//.gesture(
//    DragGesture()
//        .onChanged {
//            self.dragAmount = $0.translation
//    }
//        .onEnded { _ in
//        self.dragAmount = .zero
//        self.enabled.toggle()
//    }
//)
