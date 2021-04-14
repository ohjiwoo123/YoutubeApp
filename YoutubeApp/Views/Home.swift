//
//  Home.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/14.
//

import SwiftUI
import GoogleSignIn

let backgroundColor = Color(red: 31/255,green:33/255,blue:36/255)

struct Home: View {
    @EnvironmentObject var signInManager: GoogleSignInManager
    @StateObject var model = VideoModel()
    
    
    var body: some View {
        VStack {
            
            // Display the sign in button if the user is not signed in
            if !signInManager.signedIn {
                GoogleSignInButton()
                    .padding()
                    .frame(height:60)
                // move in and out from the top
                    .transition(.move(edge: .top))
                    .onOpenURL(perform: { url in
                        // Open sign in URL when the button is clicked
                        GIDSignIn.sharedInstance()
                            .handle(url)
                    })
            }
            
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
            
            // If the user is signed in, show the sign out button
            if signInManager.signedIn {
                Button("Sign out") {
                    // Sign Out
                    GIDSignIn.sharedInstance()?.signOut()
                    // Update the sign in manager
                    signInManager.signedIn = false
                }
                .padding()
                // Move in and out from the bottom
                .transition(.move(edge: .bottom))
            }
            
        }
        // Set the text color to be white against the dark background
        .foregroundColor(.white)
        // Set the background color to the custom color
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .animation(.easeOut)
        .onAppear {
            // Restore the users previous sign in status
            GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(GoogleSignInManager())
    }
}
