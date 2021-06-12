//
//  ContentView.swift
//  CatchUpWWDC21
//
//  Created by 吉田周平 on 2021/06/11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            PostListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }
                //MARK: - [New] Badge for TabView TabItem
                .badge("New")
            ImageView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Image")
                }
                //MARK: - [New] Badge for TabView TabItem
                .badge(1)
            MaterialView()
                .tabItem {
                    Image(systemName: "circle.bottomhalf.fill")
                    Text("Material")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

