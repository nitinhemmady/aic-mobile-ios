//
//  CrashlyticsService.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

protocol CrashlyticsService {
    func record(report: CrashlyticsReport)
    func setProperty(value: String, for key: String)
}
