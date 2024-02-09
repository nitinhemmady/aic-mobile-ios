//
//  PlistFileLoader.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

enum PlistFileLoader {
    enum PlistError: Error {
        case fileNotFound(name: String)
        case incorrectFormat
        
        var errorDescription: String? {
            switch self {
            case .fileNotFound:
                return "File Not Found"
                
            case .incorrectFormat:
                return "Error reading unrecognized format"
            }
        }
    }

    static func loadFile<T>(with name: String) throws -> T {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
              let plistXML = FileManager.default.contents(atPath: path) else {
            throw PlistError.fileNotFound(name: name)
        }

        if let reslut = try? PropertyListSerialization.propertyList(from: plistXML,
                                                                    options: .mutableContainersAndLeaves,
                                                                    format: nil) as? T {
            return reslut
        } else {
            throw PlistError.incorrectFormat
        }
    }

}
