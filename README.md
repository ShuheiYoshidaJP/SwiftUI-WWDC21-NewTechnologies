# SwiftUI-WWDC21-NewTechnologies
<img src="https://user-images.githubusercontent.com/62702170/121763124-7b49a180-cb74-11eb-950b-88cbccca355a.gif" width="300">

## [Updating an App to Use Swift Concurrency](https://developer.apple.com/documentation/swift/swift_standard_library/concurrency/updating_an_app_to_use_swift_concurrency)

> Improve your app’s performance by refactoring your code to take advantage of asynchronous functions in Swift.

PostListViewModel.fetchData
``` swift
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
```

## [Pull to refresh](https://developer.apple.com/documentation/SwiftUI/View/refreshable(action:))

> Marks this view as refreshable.

PostListView
``` swift
.refreshable {
    await viewModel.fetchData()
}
```

## [SearchBar](https://developer.apple.com/documentation/SwiftUI/View/searchable(_:text:placement:)-1r1py)

> Marks this view as searchable, which configures the display of a search field.

PostListView
```swift
.searchable("Search", text: $viewModel.searchText, suggestions: {
    ForEach(viewModel.searchedData) { post in
        Text(post.title)
    }
})
```

## [Swipe Action](https://developer.apple.com/documentation/SwiftUI/View/swipeActions(edge:allowsFullSwipe:content:))

> Adds custom swipe actions to a row in a list.

PostListView
``` swift
.swipeActions(edge: .trailing, allowsFullSwipe: false) {
    Button {
        //TODO: add action
    } label: {
        Image(systemName: "trash.fill")
    }
    .tint(.red)
}
```

## [Badge for TabView TabItem](https://developer.apple.com/documentation/SwiftUI/View/badge(_:)-84e43)

> Generates a badge for the view from a localized string key.

ContentView
``` swift
.badge("New")
```

## [AsyncImage](https://developer.apple.com/documentation/SwiftUI/AsyncImage)

> A view that asynchronously loads and displays an image.

ImageView
``` swift
AsyncImage(url: url) { image in
    image
        .resizable()
        .scaledToFit()
} placeholder: {
    ProgressView()
}
.frame(width: 200, height: 200, alignment: .center)
.navigationTitle("AsyncImage")
```

## [Material](https://developer.apple.com/documentation/SwiftUI/Material)

> A background material type.

MaterialView
``` swift
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
```

