//
//  API.swift
//  NewsApp(Testing API)
//
//  Created by Maximilian on 01.01.2023.
//

import Foundation

final class API {
    static let shared = API()
    
    struct Constants {
        static let topHeadlineURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=eda6154a62744b7bbad849130a7f7b6f")
    }
    private init() {}
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlineURL else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do { let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                }catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    
}

//Создаем модели
struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}
struct Source : Codable {
    let name: String
}
