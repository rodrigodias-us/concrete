//
//  HomeViewController.swift
//  Concrete
//
//  Created by Rodrigo Dias on 07/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    // MARK: - Proprieties
    private let repositoriesBO = RepositoriesBO()
    private var page:Int32 = 1
    private let indicatorFooter = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    var repositories:[Repository] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 105
        
        setupIndicatorFooter()
        loadRepositories()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let vc = segue.destination as? PullRequestsViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            vc.currentRepository = repositories[indexPath.row]
        }
    }
    
    func loadRepositories() {
        repositoriesBO.search(q: "language:Java", sort: "stars", page: page) { (response, error) in
            if error != nil {
                self.alertWebError {
                    self.loadRepositories()
                }
            } else {
                if let items = response?.items {
                    self.repositories += items
                    self.page += 1
                    self.tableView.reloadData()
                }
            }
            self.stopLoading()
        }
        startLoading()
    }
    
    // MARK: - Loading
    func setupIndicatorFooter() {
        indicatorFooter.frame.size.height = 100
        indicatorFooter.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        indicatorFooter.startAnimating()
    }
    
    func startLoading() {
        tableView.tableFooterView = indicatorFooter
    }
    
    func stopLoading() {
        tableView.tableFooterView = nil
    }
    
    func loadingState() -> Bool {
        return tableView.tableFooterView == nil
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier) as! RepositoryTableViewCell
        
        cell.setup(repository: repositories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repositories.count - 1,
            loadingState() {
            loadRepositories()
        }
    }
}
