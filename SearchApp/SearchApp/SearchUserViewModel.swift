//
//  SearchUserViewModel.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 21/11/23.
//

import Foundation
import Combine
import UIKit
struct UserSearchResponse: Decodable {
    var items: [User]
}

struct User: Decodable, Identifiable, Hashable {
    var id: Int64
    var login: String
    var avatar_url: URL
}
class SearchUserViewModel: ObservableObject {
    @Published private (set) var userList = [User]()
    @Published private (set) var userAvatarImages = [User: UIImage]()
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
                    //print(result)
                    //print("\n----\n")
                    print("Count is: \(result.count)")
                }
            })
            .store(in: &cancellable)
    }
    
    func fetchAvatarImage(user: User)  {
        guard case .none = userAvatarImages[user] else {
            return
        }
        print("Avatar url: \(user.avatar_url)")
        let urlRequest = URLRequest(url: user.avatar_url)
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map {
                print($0.data)
                return UIImage(data: $0.data)
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("error is: \(error)")
                }
            } receiveValue: { [weak self] image in
                if let strongSelf = self {
                    strongSelf.userAvatarImages[user] = image
                }
            }
            .store(in: &cancellable)
    }
}
