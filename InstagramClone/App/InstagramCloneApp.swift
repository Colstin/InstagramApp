//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct InstagramCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(registrationViewModel)
        }
    }
}

/* FINAL NOTES:
 1. We needed to create separate 2 ProfileView because we can't have 2 Navigation stacks so essentially 1 uses the navigation stack and one doesn't
 2. @MainActor - Very helpful alternative compared to using Dispatch.main.queue when working with the Async/ Await
 3. KingFisher Package - We downloaded this as an alternative to Async Image due in order to allow image caching, image caching allows us to locally store the image so we dont keep loading the image from an API every time we look at it.
 4. For 2 collections of data and pointing to them refer to the FeedViewModel
 */
