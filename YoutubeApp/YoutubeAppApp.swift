//
//  YoutubeAppApp.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/13.
//

import SwiftUI
import GoogleSignIn

@main
struct YoutubeAppApp: App {
    
    // Create a google sign in manager
    let signInManager = GoogleSignInManager()
    
    init() {
        
        // Set the client Id and delegate
        GIDSignIn.sharedInstance()?.clientID = Constants.GID_SIGN_IN_ID
        GIDSignIn.sharedInstance()?.delegate = signInManager
        
        // Specify that we need to authenticate users for youtube access
        GIDSignIn.sharedInstance()?.scopes.append(Constants.YT_AUTH_SCOPE)
    }
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(signInManager)
        }
    }
}
