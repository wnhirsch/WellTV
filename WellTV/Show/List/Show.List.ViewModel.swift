//
//  Show.List.ViewModel.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

extension Scene.Show.List {
    
    class ViewModel {
        
        private let coordinator: Coordinator.Show
        private let worker: Worker.Show
        var shows: [Model.Show] = []
        var actualPage: Int = 1
        
        var onStartFetchingShows: (() -> Void)?
        var onSuccessFetchingShows: (() -> Void)?
        var onFailureFetchingShows: (() -> Void)?

        init(coordinator: Coordinator.Show, worker: Worker.Show) {
            self.coordinator = coordinator
            self.worker = worker
        }
        
        func fetchShows() {
            onStartFetchingShows?()
            
            worker.getShowsByPage(page: actualPage, success: { [weak self] shows in
                guard let self = self else { return }
                self.shows = shows
                self.onSuccessFetchingShows?()
            }, failure: { [weak self] in
                guard let self = self else { return }
                self.onFailureFetchingShows?()
            })
        }
        
    }
    
}
