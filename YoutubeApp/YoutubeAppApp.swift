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
    }
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(signInManager)
        }
    }
}
