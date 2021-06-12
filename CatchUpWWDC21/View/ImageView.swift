//
//  ImageView.swift
//  CatchUpWWDC21
//
//  Created by 吉田周平 on 2021/06/12.
//

import SwiftUI

struct ImageView: View {
    let url = URL(string: "https://images.unsplash.com/photo-1601933973783-43cf8a7d4c5f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80")
    var body: some View {
        NavigationView{
            //MARK: - [New] AsyncImage
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200, alignment: .center)
            .navigationTitle("AsyncImage")
        }
    }
}
