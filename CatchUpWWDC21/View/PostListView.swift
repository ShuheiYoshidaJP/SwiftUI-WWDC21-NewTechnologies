//
//  PostListView.swift
//  CatchUpWWDC21
//
//  Created by 吉田周平 on 2021/06/12.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject var viewModel = PostListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.postList) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                        Text(item.body)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    //MARK: - [New] Swipe Action
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            //TODO: add action
                        } label: {
                            Image(systemName: "trash.fill")
                        }
                        .tint(.red)
                    }
                }
            }
            //MARK: - [New] Pull to refresh
            .refreshable {
                await viewModel.fetchData()
            }
            //MARK: - [New] Search Bar
            .searchable("Search", text: $viewModel.searchText, suggestions: {
                ForEach(viewModel.searchedData) { post in
                    Text(post.title)
                }
            })
            .navigationTitle("Pull to refresh")
        }
    }
}
