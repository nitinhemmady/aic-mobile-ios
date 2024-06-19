//
//  CrashlyticsReport.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

protocol CrashlyticsReport {
    var error: Error { get }
    var log: String { get }
}
