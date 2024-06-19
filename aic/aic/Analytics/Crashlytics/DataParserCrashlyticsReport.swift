//
//  DataParserCrashlyticsReport.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

struct DataParserCrashlyticsReport: CrashlyticsReport {
    let error: Error
    let log: String

    init(error: ParseError) {
        let customDomain = ParseError.errorDomain + "." + "\(error.label)"
        self.init(
            error: NSError(
                domain: customDomain,
                code: error.code
            ),
            log: error.localizedDescription
        )
    }

    init(error: Error, log: String) {
        self.error = error
        self.log = log
    }
}
