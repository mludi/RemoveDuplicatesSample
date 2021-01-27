//
//  ContentView.swift
//  RemoveDuplicatesSample
//

//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your query", text: $viewModel.query, onCommit: {
                    viewModel.search(for: viewModel.query)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
                .disableAutocorrection(true)

                Spacer()
            }


        }
        .navigationTitle("Search")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
