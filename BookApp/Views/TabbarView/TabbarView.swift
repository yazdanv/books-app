//
//  TabbarView.swift
//  BookApp
//
//  Created by Yazdan Vakili on 23/08/2024.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            BooksListView(isFavorites: false)
                .tabItem {
                    Label("Books", systemImage: "book.fill")
                }
            
            BooksListView(isFavorites: true)
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    TabbarView()
}
