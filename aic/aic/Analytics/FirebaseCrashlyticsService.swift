//
//  FirebaseCrashlyticsService.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation
import FirebaseCrashlytics

struct FirebaseCrashlyticsService: CrashlyticsService {
    private let crashlytics: Crashlytics

    init() {
        self.init(crashlytics: .crashlytics())
    }

    init(crashlytics: Crashlytics) {
        self.crashlytics = crashlytics
    }

    func record(report: CrashlyticsReport) {
        crashlytics.log(report.log)
        crashlytics.record(error: report.error)
    }

    func setProperty(value: String, for key: String) {
        crashlytics.setCustomValue(value, forKey: key)
    }
}
