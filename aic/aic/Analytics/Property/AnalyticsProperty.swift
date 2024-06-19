//
//  AnalyticsProperty.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

struct AnalyticsProperty: CrashlyticsProperty {
    let key: String
    let value: String

    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

extension AnalyticsProperty {

    static func make(by type: AnalyticsPropertyType) -> AnalyticsProperty {
        switch type {
        case .membership:
            AnalyticsProperty(
                key: type.key,
                value: UserDefaults.standard.object(
                    forKey: Common.UserDefaults.memberInfoIDUserDefaultsKey
                ) != nil ? "Member" : "None"
            )

        case .appLanguage:
            AnalyticsProperty(
                key: type.key,
                value: Common.stringForLanguage[Common.currentLanguage, default: "English"]
            )

        case .deviceLanguage:
            AnalyticsProperty(
                key: type.key,
                value: Locale.preferredLanguages.first ?? "unknown"
            )
        }
    }

}
