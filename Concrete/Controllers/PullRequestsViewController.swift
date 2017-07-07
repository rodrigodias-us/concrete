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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = pullRequests[indexPath.row].user?.login
        
        return cell
    }
}
