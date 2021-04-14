//
//  Home.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/14.
//

import SwiftUI

let backgroundColor = Color(red: 31/255,green:33/255,blue:36/255)

struct Home: View {
    @StateObject var model = VideoModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(model.videos,id:\.videoId) { video in
                    // Display a row for each video
                    VideoRow(videoPreview: VideoPreview(video:video))
                        .padding()
                }
            }
            .padding(.top, 20)
        }
        // Set the text color to be white against the dark background
        .foregroundColor(.white)
        // Set the background color to the custom color
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .animation(.easeOut)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
