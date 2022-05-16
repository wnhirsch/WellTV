//
//  Repository.Show.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

import Moya

extension Repository {
    
    struct Show {

        enum Target: APITarget {
            case getShowsByPage(page: Int)

            var path: String {
                switch self {
                case .getShowsByPage(let page):
                    return "/shows?page=\(page)"
                }
            }

            var method: Method {
                switch self {
                case .getShowsByPage:
                    return .get
                }
            }

            var task: Task {
                switch self {
                case .getShowsByPage:
                    return .requestPlain
                }
            }

            var headers: [String: String]? {
               return sessionHeader()
            }
        }

        private let provider: MoyaProvider<Target> = APIProvider<Target>().build()
    }
    
}

extension Repository.Show {

    func getShowsByPage(page: Int, completion: @escaping Completion) {
        provider.request(.getShowsByPage(page: page), completion: completion)
    }
}
