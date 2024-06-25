//
//  ShimmerModifier.swift
//
//
//  Created by Leonardo Medeiros on 25/06/24.
//

import SwiftUI

private struct ShimmerModifier: ViewModifier {
    private let defaulGradientForHiddenContent = Gradient(colors: [.gray.opacity(0.5), .gray.opacity(0.2), .gray.opacity(0.5)])
    private let defaulGradientForUnhiddenContent = Gradient(colors: [.black.opacity(0.3), .black, .black.opacity(0.3)])
    
    private let hide: Bool
    private let hideMaskColor: Color
    private let hideMaskRadius: CGFloat
    private let gradient: Gradient
    private let animationDuration: TimeInterval
    private let animationDelay: TimeInterval
    
    @State private var isAnimating = false
    
    public init(hide: Bool, hideMaskColor: Color, hideMaskRadius: CGFloat, gradient: Gradient?, animationDuration: TimeInterval, animationDelay: TimeInterval) {
        self.hide = hide
        self.hideMaskColor = hideMaskColor
        self.hideMaskRadius = hideMaskRadius
        self.gradient = gradient ?? (hide
                                     ? defaulGradientForHiddenContent
                                     : defaulGradientForUnhiddenContent)
        self.animationDuration = animationDuration
        self.animationDelay = animationDelay
    }
    
    @ViewBuilder private func applyHideMaskOnContentIfNecessary(content: Content) -> some View {
        if hide {
            content.overlay(RoundedRectangle(cornerRadius: hideMaskRadius)
                .foregroundStyle(hideMaskColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity))
        } else { content }
    }
    
    public func body(content: Content) -> some View {
        let startPoint = isAnimating
        ? UnitPoint(x: -0.3, y: -0.3)
        : UnitPoint(x: 1, y: 1)
        
        let endPoint = isAnimating
        ? UnitPoint(x: 0, y: 0)
        : UnitPoint(x: 1.3, y: 1.3)
        
        let animation = Animation
            .linear(duration: animationDuration)
            .delay(animationDelay)
            .repeatForever(autoreverses: false)
        
        applyHideMaskOnContentIfNecessary(content: content)
            .mask(LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
                .mask(RoundedRectangle(cornerRadius: hideMaskRadius)))
            .onAppear {
                isAnimating = true
                withAnimation(animation) {
                    isAnimating = false
                }
            }
    }
}

extension View {
    @ViewBuilder public func shimmerize(
        active: Bool = true,
        shouldAddHideMask: Bool = true,
        hideMaskColor: Color = Color.gray,
        hideMaskRadius: CGFloat = 0.0,
        gradient: Gradient? = nil,
        animationDuration: TimeInterval = 1.7,
        animationDelay: TimeInterval = 0.5
    ) -> some View {
        if active {
            modifier(ShimmerModifier(hide: shouldAddHideMask,
                                     hideMaskColor: hideMaskColor,
                                     hideMaskRadius: hideMaskRadius,
                                     gradient: gradient,
                                     animationDuration: animationDuration,
                                     animationDelay: animationDelay))
        } else { self }
    }
}
