//
//  HomeViewController.swift
//  Concrete
//
//  Created by Rodrigo Dias on 07/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var repositories:[Repository] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 105
        
        loadRepositories()
    }
    
    func loadRepositories() {
        RepositoriesBO.search(q: "language:Java", sort: "stars", page: 1) { (response, error) in
            if let items = response?.items {
                self.repositories = items
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let vc = segue.destination as? PullRequestsViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            vc.currentRepository = repositories[indexPath.row]
        }
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
}
