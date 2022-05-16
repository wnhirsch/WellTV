//
//  Show.List.ViewController.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

import UIKit

extension Scene.Show.List {

    class ViewController: UIViewController, Loadable {

        private let mainView: View
        private let viewModel: ViewModel

        init(viewModel: ViewModel) {
            mainView = View()
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func loadView() {
            view = mainView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupTableView()
            bind()
            viewModel.fetchShows()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        private func setupTableView() {
            mainView.tableView.delegate = self
            mainView.tableView.dataSource = self
        }
        
        private func bind() {
            viewModel.onStartFetchingShows = { [weak self] in
                guard let self = self else { return }
                self.showLoading()
            }
            
            viewModel.onSuccessFetchingShows = { [weak self] in
                guard let self = self else { return }
                self.hideLoading()
                self.mainView.tableView.reloadData()
            }
            
            viewModel.onFailureFetchingShows = {
                print("teste")
            }
        }
        
    }
    
}

extension Scene.Show.List.ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.shows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(Scene.Show.List.Cell.self, for: indexPath)
        cell.setup(model: viewModel.shows[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: action
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
