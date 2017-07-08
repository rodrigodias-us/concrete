//
//  PullRequestsViewController.swift
//  Concrete
//
//  Created by Rodrigo Dias on 07/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class PullRequestsViewController: UIViewController {    
    var currentRepository:Repository? = nil
    var pullRequests:[PullRequest] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 125
        
        loadPullRequests()
    }
    
    func loadPullRequests() {
        if  let currentRepository = currentRepository,
            let creator = currentRepository.owner?.login,
            let repository = currentRepository.name {
            
            PullRequestsAPI.reposCriadorRepositorioPullsGet(criador: creator, repositorio: repository, completion: { (pullRequests, error) in
                if let pullRequests = pullRequests {
                    self.pullRequests = pullRequests
                    self.tableView.reloadData()
                }
            })
        }
    }
}

extension PullRequestsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PullRequestTableViewCell
        
        cell.setup(pullRequest: pullRequests[indexPath.row])
        
        return cell
    }
}
