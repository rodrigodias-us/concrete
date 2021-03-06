//
// PullRequestsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



open class PullRequestsAPI: APIBase {
    /**
     Get Pull Requests
     
     - parameter criador: (path) Criador 
     - parameter repositorio: (path) Repositorio 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open func reposCriadorRepositorioPullsGet(criador: String, repositorio: String, completion: @escaping ((_ data: [PullRequest]?,_ error: Error?) -> Void)) {
        reposCriadorRepositorioPullsGetWithRequestBuilder(criador: criador, repositorio: repositorio).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Get Pull Requests
     - GET /repos/{criador}/{repositorio}/pulls
     - Get Pull Requests
     - examples: [{contentType=application/json, example=[ {
  "updated_at" : "2017-06-30T16:55:43Z",
  "html_url" : "https://github.com/ReactiveX/RxJava/pull/5453",
  "created_at" : "2017-06-30T16:55:43Z",
  "id" : 100,
  "state" : "open",
  "title" : "2.x: See if sudo required results in consistent & faster build times",
  "body" : "I asked the Travis support about the slow build times of lately and they suggested I try `sudo:required` to have an isolated build VM instead of the shared container-based one. I'll rerun this PR a couple of times to see the effects.",
  "user" : {
    "avatar_url" : "https://avatars2.githubusercontent.com/u/6407041?v=3",
    "id" : 1,
    "login" : "ReactiveX"
  }
} ]}]
     
     - parameter criador: (path) Criador 
     - parameter repositorio: (path) Repositorio 

     - returns: RequestBuilder<[PullRequest]> 
     */
    open func reposCriadorRepositorioPullsGetWithRequestBuilder(criador: String, repositorio: String) -> RequestBuilder<[PullRequest]> {
        var path = "/repos/{criador}/{repositorio}/pulls"
        path = path.replacingOccurrences(of: "{criador}", with: "\(criador)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{repositorio}", with: "\(repositorio)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[PullRequest]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
