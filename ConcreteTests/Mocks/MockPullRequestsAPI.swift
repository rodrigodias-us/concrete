//
//  MockSearchAPI.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import XCTest

class MockPullRequestsAPI: PullRequestsAPI {
    override open func reposCriadorRepositorioPullsGet(criador: String, repositorio: String, completion: @escaping ((_ data: [PullRequest]?,_ error: Error?) -> Void)) {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "pullrxjava", ofType: "json")!
        do {
            let data = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            let response = Decoders.decode(clazz: [PullRequest].self, source: jsonResult as AnyObject)
            completion(response, nil)
        } catch {
            XCTFail("Mock file no found or broken.")
        }
    }
}
