//
//  Worker.Show.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

extension Worker {
    
    class Show {
        
        private let api: Repository.Show
        
        init(api: Repository.Show = .init()) {
            self.api = api
        }
        
        func getShowsByPage(page: Int, success: (([Model.Show]) -> Void)? = nil, failure: (() -> Void)? = nil) {
            api.getShowsByPage(page: page) { result in
                switch result {
                case let .success(response):
                    do {
                        let shows = try response.mapObject([Model.Show].self)
                        success?(shows)
                    } catch let error {
                        print(error)
                        failure?()
                    }
                case let .failure(error):
                    print(error)
                    failure?()
                }
            }
        }
        
    }
    
}
