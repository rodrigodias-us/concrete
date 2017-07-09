//
//  PullRequestsBO.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class PullRequestsBO {
    var dataProvider = PullRequestsAPI()
    
    func query(criador: String, repositorio: String, completion: @escaping ((_ data: [PullRequest]?,_ error: Error?) -> Void)) {
        dataProvider.reposCriadorRepositorioPullsGet(criador: criador, repositorio: repositorio) { (pullRequests, error) in
            completion(pullRequests, error)
        }
    }
}
