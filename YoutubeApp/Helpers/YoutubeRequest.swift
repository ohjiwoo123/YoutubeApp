//
//  YoutubeRequest.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/14.
//

import Foundation
import Alamofire

extension Session {
    
    /// Sends an authenticated request to the Youtube Data API v3
    func requestYoutube(
        relativeUrl: String,
        method: HTTPMethod,
        json: Bool = false,
        parameters: Parameters? = nil,
        accessToken: String,
        completion: ((AFDataResponse<Any>) -> Void)? = nil
    ) {
        
        // Create a URL from the given path
        guard let url = URL(string: "\(Constants.API_URL)/\(relativeUrl)")
                else {
            print("Couldn't get URL for relative path \(relativeUrl)")
            return
            }
        
        // Create the AF request
                AF.request(
                url,
                method: method,
                parameters: parameters,
                encoding: json ? JSONEncoding.default : URLEncoding.default,
                headers: ["Authorization": "Bearer \(accessToken)", "Accept": "application/json"]
        )
                .validate().responseJSON { response in
                
                // Check the status of the request
                switch response.result {
                case .success:
                    break
                case .failure(let error):
                    print("Youtube data api call failed with error\(error.failureReason ?? error.localizedDescription)")
                        return
                }
                
                // Call the completion handler
                    if let completion = completion {
                        completion(response)
                        
                    }
                
        }
    }
}
