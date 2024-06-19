//
//  AnalyticsPropertyType.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

enum AnalyticsPropertyType: String {
    case membership = "Membership"
    case appLanguage = "Language"
    case deviceLanguage = "DeviceLanguage"

    var key: String { self.rawValue }
}
