//
//  AvatarView.swift
//  SwiftUI-Grid
//
//  Created by Ethan on 05/10/2021.
//
import SwiftUI

struct AvatarView: View {
    
    let avatar: Avatar
    var width: CGFloat
    var height: CGFloat
    var font: Font
    
    var body: some View {
        VStack {
            Image(avatar.imageName)
                .resizable()
                .frame(width: width, height: height, alignment: .center)
                .scaledToFit()
            Text(avatar.name)
                .font(font)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor.systemIndigo))
                //.scaledToFit()
                .minimumScaleFactor(0.8)
        }
        .padding()
        .background(Color.green)
    }
}
