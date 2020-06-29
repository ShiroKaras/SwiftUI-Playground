//
//  SoftButtonStyle.swift
//  Neumorphic
//
//  Created by Djuro Alfirevic on 6/29/20.
//  Copyright © 2020 Djuro Alfirevic. All rights reserved.
//

import SwiftUI

public struct SoftDynamicButtonStyle<S: Shape> : ButtonStyle {

    // MARK: - Properties
    var shape: S
    var mainColor: Color
    var textColor: Color
    var darkShadowColor: Color
    var lightShadowColor: Color
    
    // MARK: - Initializer
    public init(_ shape: S, mainColor: Color, textColor: Color, darkShadowColor: Color, lightShadowColor: Color) {
        self.shape = shape
        self.mainColor = mainColor
        self.textColor = textColor
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
    }
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            configuration.label
                .foregroundColor(textColor)
                .padding()
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .background(
                ZStack {
                    shape.fill(mainColor)
                        .softInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, spread: 0.15, radius: 3)
                        .opacity(configuration.isPressed ? 1 : 0)

                    shape.fill(mainColor)
                        .softOuterShadow(darkShadow: darkShadowColor, lightShadow: lightShadowColor, offset: 6, radius: 3)
                        .opacity(configuration.isPressed ? 0 : 1)
                }
            )
        }
        
    }
    
}

@available(*, deprecated, message: "Use SoftDynamicButtonStyle instead")
public struct SoftButtonStyle<S: Shape> : ButtonStyle {

    // MARK: - Properties
    var shape: S
    var mainColor: Color
    var textColor: Color
    var darkShadowColor: Color
    var lightShadowColor: Color
    
    // MARK: - Initializer
    public init(_ shape: S, mainColor : Color, textColor : Color, darkShadowColor: Color, lightShadowColor: Color) {
        self.shape = shape
        self.mainColor = mainColor
        self.textColor = textColor
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
    }
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
                shape.fill(mainColor)
                    .softInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, spread: 0.15, radius: 3)
                    .opacity(configuration.isPressed ? 1 : 0)
            
                shape.fill(mainColor)
                    .softOuterShadow(darkShadow: darkShadowColor, lightShadow: lightShadowColor, offset: 6, radius: 3)
                    .opacity(configuration.isPressed ? 0 : 1)

            configuration.label
                .foregroundColor(textColor)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
        }
    }
    
}


extension Button {
    public func softButtonStyle<S : Shape>(_ content: S, mainColor: Color = Neumorphic.shared.mainColor(), textColor: Color = Neumorphic.shared.secondaryColor(), darkShadowColor: Color = Neumorphic.shared.darkShadowColor(), lightShadowColor: Color = Neumorphic.shared.lightShadowColor()) -> some View {
        self.buttonStyle(SoftDynamicButtonStyle(content, mainColor: mainColor, textColor: textColor, darkShadowColor: darkShadowColor, lightShadowColor: lightShadowColor))
    }
}
