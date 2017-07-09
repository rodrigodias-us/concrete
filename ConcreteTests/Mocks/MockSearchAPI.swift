//
//  MockSearchAPI.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import XCTest

class MockSearchAPI: SearchAPI {
    override open func searchRepositoriesGet(q: String, sort: String? = nil, page: Int32? = nil, completion: @escaping ((_ data: ResultResponse?,_ error: Error?) -> Void)) {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "repositories", ofType: "json")!
        do {
            let data = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            let response = Decoders.decode(clazz: ResultResponse.self, source: jsonResult as AnyObject)
            completion(response, nil)
        } catch {
            XCTFail("Mock file no found or broken.")
        }
    }
}
