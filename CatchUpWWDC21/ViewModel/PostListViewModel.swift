//
//  PostListViewModel.swift
//  CatchUpWWDC21
//
//  Created by 吉田周平 on 2021/06/12.
//

import Foundation

class PostListViewModel: ObservableObject {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    @Published var postList: [Post] = []
    @Published var searchText: String = ""
    
    var searchedData: [Post] {
        return postList.filter { post in
            searchText == ""
            ? true
            : post.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    //MARK: - [New] async await
    func fetchData() async {
        print("fetch data called")
        guard let url = url else {
            return
        }
        
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            let photos = try JSONDecoder().decode([Post].self, from: task.0)
            postList = photos
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
}
