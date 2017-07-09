//
//  RepositoriesBO.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class RepositoriesBO {
    var dataProvider = SearchAPI()
    
    func search(q: String, sort: String? = nil, page: Int32? = nil, completion: @escaping ((_ data: ResultResponse?,_ error: Error?) -> Void)) {
        dataProvider.searchRepositoriesGet(q: "language:Java", sort: "stars", page: 1) { (response, error) in
            completion(response, error)
        }
    }
}
