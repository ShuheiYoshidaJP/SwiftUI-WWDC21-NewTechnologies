//
//  MaterialView.swift
//  CatchUpWWDC21
//
//  Created by 吉田周平 on 2021/06/12.
//

import SwiftUI

struct MaterialView: View {
    let width: CGFloat = 200
    let height: CGFloat = 200
    let opacity = 0.4
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.mint)
                        .background(Color.cyan)
                        .frame(width: width, height: height)
                    ZStack(alignment: .center) {
                        Color.white
                            .opacity(opacity)
                            .frame(width: width * 0.7, height: height/4)
                            .cornerRadius(8)
                        Text("Before")
                            .foregroundColor(.black)
                            .frame(width: width, height: height/4)
                    }
                }
                
                
                ZStack(alignment: .bottom) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.mint)
                        .background(Color.cyan)
                        .frame(width: width, height: height)
                    Text("Use Material")
                        .frame(width: width * 0.5)
                        .padding()
                        //MARK: - [New] Material
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                        
                }
                
            }
            .navigationTitle("Material")
        }
    }
}
