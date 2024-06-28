//
//  ParseError.swift
//  aic
//
//  Copyright © 2024 Art Institute of Chicago. All rights reserved.
//

import Foundation

enum ParseError: LocalizedError {
    case objectParseFailure
    case missingKey(key: String)
    case badURLString(string: String)
    case badBoolString(string: String)
    case badFloatString(string: String)
    case badIntString(string: String)
    case badCLLocationString(string: String)
    case badPointString(string: String)
    case invalidDateFormat(dateString: String)
    case objectNotFound(nid: Int)
    case invalidObject(message: String, data: String)
    case objectGalleryNotFound(name: String, data: String)
    case galleryNameNotFound(galleryName: String)
    case galleryIdNotFound(galleryId: Int)
    case galleryNotFound(data: String)
    case tourStopsNotFound(tourId: Int)
    case jsonObjectNotFoundForKey(key: String)
    case languageNotFound(key: String, data: String)
    case audioFileNotFound(nid: Int)
    case audioFilesNotFound(key: String, data: String)
    case invalidAudioFile(message: String, data: String)
    case translationNotFound(key: String, data: String)
    case invalidTranslation(message: String, data: String)
    case generalInfoNotFound(data: String)
    case invalidAudioCommentary(message: String, data: String)
    case invalidTourCategory(message: String, data: String)
    case invalidTour(message: String, data: String)
    case invalidMapAnnotation(message: String, data: String)
    case invalidMapFloor(message: String, data: String)
    case invalidDataSetting(message: String, data: String)
    case invalidExhibition(message: String, data: String)
    case invalidEvent(message: String, data: String)
    case invalidSearchArtworks(message: String, data: String)
    case invalidSearchAutocomplete(message: String, data: String)
    case invalidSearchContent(message: String, data: String)
    case invalidSearchTours(message: String, data: String)
    case invalidSearchExhibitions(message: String, data: String)
    case invalidMessage(message: String, data: String)
    case noValidTourStops

    static var errorDomain: String { "\(Bundle.identifier)" + "." + "JSONErrorDomain" }

    var label: String {
        let mirror = Mirror(reflecting: self)
        if let label = mirror.children.first?.label {
            return label
        } else {
            return String(describing: self)
        }
    }

    var code: Int {
        switch self {
        case .objectParseFailure:
            1001
        case .missingKey:
            1002
        case .badURLString:
            1003
        case .badBoolString:
            1004
        case .badFloatString:
            1005
        case .badIntString:
            1006
        case .badCLLocationString:
            1007
        case .badPointString:
            1008
        case .invalidDateFormat:
            1009
        case .objectNotFound:
            1010
        case .invalidObject:
            1011
        case .objectGalleryNotFound:
            1012
        case .galleryNameNotFound:
            1013
        case .galleryIdNotFound:
            1014
        case .galleryNotFound:
            1015
        case .tourStopsNotFound:
            1016
        case .jsonObjectNotFoundForKey:
            1017
        case .languageNotFound:
            1018
        case .audioFileNotFound:
            1019
        case .audioFilesNotFound:
            1020
        case .invalidAudioFile:
            1021
        case .translationNotFound:
            1022
        case .invalidTranslation:
            1023
        case .generalInfoNotFound:
            1024
        case .invalidAudioCommentary:
            1025
        case .invalidTourCategory:
            1026
        case .invalidTour:
            1027
        case .invalidMapAnnotation:
            1028
        case .invalidMapFloor:
            1029
        case .invalidDataSetting:
            1030
        case .invalidExhibition:
            1031
        case .invalidEvent:
            1032
        case .invalidSearchArtworks:
            1033
        case .invalidSearchAutocomplete:
            1034
        case .invalidSearchContent:
            1035
        case .invalidSearchTours:
            1036
        case .invalidSearchExhibitions:
            1037
        case .invalidMessage:
            1038
        case .noValidTourStops:
            1039
        }
    }

    var errorDescription: String? {
        switch self {
        case .objectParseFailure:
            "Unknown parse error"
            
        case .missingKey(let key):
            "The key \"\(key)\" is trying to be retrieved does not exist."

        case .badURLString(let string):
            "Could not create NSURL from string \"\(string)\""
            
        case .badBoolString(let string):
            "Could not cast String \"\(string)\" to Bool"

        case .badFloatString(let string):
            "Could not cast String \"\(string)\" to Float"

        case .badIntString(let string):
            "Could not cast String \"\(string)\" to Int"

        case .badCLLocationString(let string):
            "Could not create CLLocationCoordinate2D from string \"\(string)\""
            
        case .badPointString(let string):
            "Could not create CGPoint from string \"\(string)\""
            
        case .invalidDateFormat(let dateString):
            "Could not create Date from string \"\(dateString)\""
            
        case .audioFileNotFound(let nid):
            "Could not find Audio File for nid \(nid)"
            
        case .objectNotFound(let nid):
            "Could not find Object with nid \(nid)"

        case .invalidObject(let message, let data):
            "\(message) Invalid Object: \n\(data)\n"

        case .objectGalleryNotFound(let name, let data):
            "Could not find Object with gallery name \(name) data: \n\(data)\n"

        case .galleryNameNotFound(let galleryName):
            "Could not find gallery with name '\(galleryName)'"

        case .galleryIdNotFound(let galleryId):
            "Could not find gallery with Id '\(galleryId)'"

        case .galleryNotFound(let data):
            "Could not find Gallery: \n\(data)\n"

        case .tourStopsNotFound(let tourId):
            "Could not find stops in tour with Id '\(tourId)'"
            
        case .noValidTourStops:
            "Could not parse stops data"

        case .jsonObjectNotFoundForKey(let key):
            "Could not find JSON object for key '\(key)'"

        case .languageNotFound(let key, let data):
            "Could not parse Language with key \(key): \n\(data)\n"

        case .audioFilesNotFound(let key, let data):
            "Could not parse Audio File with key \(key): \n\(data)\n"

        case .invalidAudioFile(let message, let data):
            "\(message) Invalid Audio File: \n\(data)\n"

        case .translationNotFound(let key, let data):
            "Could not parse Translation with key \(key): \n\(data)\n"

        case .invalidTranslation(let message, let data):
            "\(message) Invalid Audio Commentary: \n\(data)\n"

        case .generalInfoNotFound(let data):
            "Could not parse General Info: \n\(data)\n"

        case .invalidAudioCommentary(let message, let data):
            "\(message) Invalid Audio Commentary: \n\(data)\n"

        case .invalidTourCategory(let message, let data):
            "\(message) Invalid Tour Category: \n\(data)\n"

        case .invalidTour(let message, let data):
            "\(message) Invalid Tour: \n\(data)\n"

        case .invalidMapAnnotation(let message, let data):
            "\(message) Invalid Map Annotation: \n\(data)\n"

        case .invalidMapFloor(let message, let data):
            "\(message) Invalid Map Floor: \n\(data)\n"

        case .invalidDataSetting(let message, let data):
            "\(message) Invalid Data Setting: \n\(data)\n"

        case .invalidExhibition(let message, let data):
            "\(message) Invalid Exhibition: \n\(data)\n"

        case .invalidEvent(let message, let data):
            "\(message) Invalid Event: \n\(data)\n"

        case .invalidSearchArtworks(let message, let data):
            "\(message) Invalid Search Artworks: \n\(data)\n"

        case .invalidSearchAutocomplete(let message, let data):
            "\(message) Invalid Search Autocomplete: \n\(data)\n"

        case .invalidSearchContent(let message, let data):
            "\(message) Invalid Search Content: \n\(data)\n"

        case .invalidSearchTours(let message, let data):
            "\(message) Invalid Search Tours: \n\(data)\n"

        case .invalidSearchExhibitions(let message, let data):
            "\(message) Invalid Search Exhibitions: \n\(data)\n"

        case .invalidMessage(let message, let data):
            "\(message) Invalid Message: \n\(data)\n"
        }
    }
}
