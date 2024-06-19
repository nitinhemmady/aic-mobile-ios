//
//  CrashlyticsManager.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

final class CrashlyticsManager {
    private let service: CrashlyticsService
    private let properties: [CrashlyticsProperty]

    init(
        service: CrashlyticsService,
        properties: [CrashlyticsProperty]
    ) {
        self.service = service
        self.properties = properties
        setupServiceProperites()
    }

    private func setupServiceProperites() {
        properties.forEach {
            service.setProperty(
                value: $0.value,
                for: $0.key
            )
        }
    }

    func record(_ report: CrashlyticsReport) {
        service.record(report: report)
    }
}
