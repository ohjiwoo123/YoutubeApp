//
//  GoogleSignInButton.swift
//  YoutubeApp
//
//  Created by ohjiwoo on 2021/04/14.
//

import SwiftUI
import GoogleSignIn

struct GoogleSignInButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        // Create the view
        let view = GIDSignInButton()
        
        // Set it's presenting view controller
        // Since the button is displayed in the home view, we know it's presenting view controller will be the root view controller for our app
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        
        // Return the configured button
        return view
    }
   
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct GoogleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButton()
    }
}
