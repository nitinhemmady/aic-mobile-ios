//
//  Bundle+ApplicationInfo.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

extension Bundle {
    static var applicationName: String {
        if let displayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String {
            return displayName
        } else if let name = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            return name
        } else {
            return "Unknown"
        }
   }

    static var versionNumber: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return version ?? "Unknown"
    }

    static var buildNumber: String {
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        return build ?? "Unknown"
    }

    static var identifier: String {
        let bundleIdentifier = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
        return bundleIdentifier ?? "Unknown"
    }


}
