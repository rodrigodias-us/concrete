//
//  RepositoriesBO.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class RepositoriesBO {
    class func search(q: String, sort: String? = nil, page: Int32? = nil, completion: @escaping ((_ data: ResultResponse?,_ error: Error?) -> Void)) {
        SearchAPI.searchRepositoriesGet(q: "language:Java", sort: "stars", page: 1, completion: completion)
    }
}
