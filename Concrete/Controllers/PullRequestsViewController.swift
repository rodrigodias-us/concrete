//
//  PullRequestsViewController.swift
//  Concrete
//
//  Created by Rodrigo Dias on 07/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class PullRequestsViewController: BaseViewController, NVActivityIndicatorViewable {
    // MARK: - Proprieties
    private let pullRequestsBO = PullRequestsBO()
    private let indicatorFooter = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    var currentRepository:Repository? = nil
    var pullRequests:[PullRequest] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 125
        
        title = currentRepository?.fullName
        
        loadPullRequests()
    }
    
    func loadPullRequests() {
        if  let currentRepository = currentRepository,
            let creator = currentRepository.owner?.login,
            let repository = currentRepository.name {
            
            pullRequestsBO.query(criador: creator, repositorio: repository, completion: { (pullRequests, error) in
                if error != nil {
                    self.alertWebError {
                        self.loadPullRequests()
                    }
                } else {
                    if let pullRequests = pullRequests {
                        self.pullRequests = pullRequests
                        self.tableView.reloadData()
                    }
                }
                self.stopAnimating()
            })
            startAnimating()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: pullRequests[indexPath.row].htmlUrl!)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
