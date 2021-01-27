//
//  File.swift
//  RemoveDuplicatesSample

import Combine
import Foundation

final class SearchViewModel: ObservableObject {
    @Published var query = ""
    private var cancellables = Set<AnyCancellable>()

    init() {
        $query
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .filter({ $0.count >= 3 })
            .removeDuplicates()
            .sink { [weak self] value in
                print(value)
                guard let self = self else { return }
                self.search(for: value)
            }
            .store(in: &cancellables)
    }

    func search(for query: String) {
        self.query = ""
    }
}
