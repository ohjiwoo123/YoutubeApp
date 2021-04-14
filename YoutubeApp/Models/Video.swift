//
//  Video.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/13.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init() {
        self.videoId = "1234567890"
        self.title = "I am a video"
        self.description = "This is a description. It should be long enough to take up at least a few lines in the UI."
        self.thumbnail = "https://i.ytimg.com/vi/0CSQUj3gjpk/hqdefault.jpg"
        self.published = Date()
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse the description
        self.title = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the published date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    
        // Parse the video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
}
