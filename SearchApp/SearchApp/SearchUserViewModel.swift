//
//  SearchUserViewModel.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 21/11/23.
//

import Foundation
import Combine
struct UserSearchResponse: Decodable {
    var items: [User]
}

struct User: Decodable, Identifiable {
    var id: Int64
    var login: String
    var avatar_url: URL
}
class SearchUserViewModel: ObservableObject {
    @Published var userList: [User] = []
    @Published var name: String = "App"
    
    private var cancellable: Set<AnyCancellable> = []
    
    func fetchUserList() {
        var urlComponents = URLComponents(string: "https://api.github.com/search/users")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTaskPublisher(for: request)
            .map{$0.data}
            .decode(type: UserSearchResponse.self, decoder: JSONDecoder())
            .map{$0.items}
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] result in
                if let strongSelf = self {
                    strongSelf.userList = result
                    print("Count is: \(result.count)")
                }
            })
            .store(in: &cancellable)
    }
}
