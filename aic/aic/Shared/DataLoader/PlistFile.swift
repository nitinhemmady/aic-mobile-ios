//
//  PlistFile.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

struct PlistFile {
    enum Error: Swift.Error {
        case fileNotFound(name: String)
        case notSupportedFormat

        var errorDescription: String? {
            switch self {
            case .fileNotFound:
                return "File Not Found"
                
            case .notSupportedFormat:
                return "Error reading unrecognized format"
            }
        }
    }

    private let name: String
    private let bundle: Bundle
    private let fileManager: FileManager
    private let ofExtension = "plist"

    init(name: String) {
        self.init(
            name: name,
            bundle: .main,
            fileManager: .default
        )
    }

    init(
        name: String,
        bundle: Bundle,
        fileManager: FileManager
    ) {
        self.name = name
        self.bundle = bundle
        self.fileManager = fileManager
    }

    func content() throws -> [String: Any] {
        let data = try plistData()
        if let reslut = try? PropertyListSerialization.propertyList(
            from: data,
            options: .mutableContainersAndLeaves,
            format: nil
        ) as? [String: Any] {
            return reslut
        } else {
            throw Error.notSupportedFormat
        }
    }

    private func plistData() throws -> Data {
        guard let path = bundle.path(forResource: name, ofType: ofExtension),
              let plistData = fileManager.contents(atPath: path) else {
            throw Error.fileNotFound(name: name)
        }

        return plistData
    }
}
