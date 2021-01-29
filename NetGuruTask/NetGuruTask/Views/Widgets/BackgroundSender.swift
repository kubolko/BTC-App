//
//  BackgroundSender.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 22/01/2021.
//

import SwiftUI

struct BackgroundSender: View {
    var body: some View {
        EmitterView(images: ["Bitcoin"], particleCount: 100, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [.white], alphaRange: 1, angle: Angle(degrees: 180), angleRange: Angle(degrees: 10), scale: 0.4, scaleRange: 0.4, speed: 1200, speedRange: 1200, animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold: 5)
    }
}

struct BackgroundSender_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSender()
    }
}
