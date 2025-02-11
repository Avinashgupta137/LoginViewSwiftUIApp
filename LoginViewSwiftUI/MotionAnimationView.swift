//
//  MotionAnimationView.swift
//  InventoryAppUI
//
//  Created by Sanskar IOS Dev on 23/01/25.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle : Int = Int.random(in: 8...12)
    @State private var isAnimating: Bool = false
    
    //RANDOM CORDINATE
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    //RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 1...80)
    }
    // RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.5...1.0)
    }
    // RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle,id: \.self) { item in
                Circle()
                    .foregroundColor(.blue)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x:randomCoordinate(),y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    }
            }
        }.frame(width: 256,height: 256)
    }
}

#Preview {
    MotionAnimationView()
}
