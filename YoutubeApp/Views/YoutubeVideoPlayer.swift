//
//  YoutubeVideoPlayer.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/14.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer:
    UIViewRepresentable {
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        
        // Create the web view
        let view = WKWebView()
        
        // Set the background color for the view
        view.backgroundColor = UIColor(backgroundColor)
        
        // Create the url for the video
        let embedUrlString = Constants.YT_EMBED_URL + video.videoId
        
        // Load the video into the web view
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        view.load(request)
        
        // Return the web view
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    }


struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
