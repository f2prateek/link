//
//  AppDelegate.swift
//  LinkBeta-Swift
//
//  Copyright © 2017 Plaid Technologies, Inc. All rights reserved.
//

import UIKit

import LinkKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
#if USE_CUSTOM_CONFIG
        setupPlaidWithCustomConfiguration()
#else
        setupPlaidLinkWithSharedConfiguration()
#endif
        return true
    }

    // MARK: Plaid Link setup with shared configuration from Info.plist
    func setupPlaidLinkWithSharedConfiguration() {
        // <!-- SMARTDOWN_SETUP_SHARED -->
        // With shared configuration from Info.plist
        PLKPlaidLink.setup { (success, error) in
            if (success) {
                // Handle success here, e.g. by posting a notification
                NSLog("Plaid Link setup was successful")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PLBPlaidLinkSetupFinished"), object: self)
            }
            else {
                NSLog("Unable to setup Plaid Link due to: \(error?.localizedDescription)")
            }
        }
        // <!-- SMARTDOWN_SETUP_SHARED -->
    }

    // MARK: Plaid Link setup with custom configuration
    func setupPlaidWithCustomConfiguration() {

        // <!-- SMARTDOWN_SETUP_CUSTOM -->
        // With custom configuration
        let linkConfiguration: PLKConfiguration
        linkConfiguration = PLKConfiguration(key: "<#YOUR_PLAID_PUBLIC_KEY#>", env: .development, product: .auth)
        PLKPlaidLink.setup(with: linkConfiguration) { (success, error) in
            if (success) {
                // Handle success here, e.g. by posting a notification
                NSLog("Plaid Link setup was successful")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PLBPlaidLinkSetupFinished"), object: self)
            }
            else {
                NSLog("Unable to setup Plaid Link due to: \(error?.localizedDescription)")
            }
        }
        // <!-- SMARTDOWN_SETUP_CUSTOM -->
    }
}