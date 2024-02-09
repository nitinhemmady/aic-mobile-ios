//
//  CommonConfigurationAccessor.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

struct CommonConfigurationAccessor {
    private static let fileName = "Config"

    private enum Configuration: String {
        case test = "Testing"
        case dataConstants = "DataConstants"
    }

    private enum TestKey {
        static let printDataErrors = "printDataErrors"
    }

    private enum DataConstantsKey {
        static let appDataURL = "appDataJSON"
        static let memberCardSOAPRequestURL = "memberCardSOAPRequestURL"
        static let ignoreOverrideImageCrop = "ignoreOverrideImageCrop"
    }

    private var container = [String: Any]()

    init() {
        container = load()
    }

    private func load() -> [String: Any] {
        var config = [String: Any]()
        do {
            config = try PlistFileLoader.loadFile(with: "Config")
            return config
        } catch {
            debugPrint(error.localizedDescription)
            return config
        }
    }

    func shouldPrintDataErrors() -> Bool {
        guard let result = try? value(
            for: .test,
            at: TestKey.printDataErrors
        ) as? Bool else { return false }
        return result
    }

    func appDataURL() -> String? {
        let result = try? value(
            for: .dataConstants,
            at: DataConstantsKey.appDataURL
        ) as? String
        return result
    }

    func memberCardSOAPRequestURL() -> String? {
        let result = try? value(
            for: .dataConstants,
            at: DataConstantsKey.memberCardSOAPRequestURL
        ) as? String
        return result
    }

    func shouldIgnoreOverrideImageCrop() -> Bool {
        guard let result = try? value(
            for: .dataConstants,
            at: DataConstantsKey.ignoreOverrideImageCrop
        ) as? Bool else { return false }
        return result
    }

    private func value(for configuration: Configuration, at key: String) throws -> Any {
        guard let value = container[configuration.rawValue] as? [String: Any] else {
            throw CocoaError(.keyValueValidation)
        }

        if let result = value[key] {
            return result
        } else {
            throw CocoaError(.keyValueValidation)
        }
    }
}
