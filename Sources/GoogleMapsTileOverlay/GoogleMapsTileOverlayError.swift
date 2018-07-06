//
//  GoogleMapsTileOverlayError.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 05.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation


public enum GoogleMapsTileOverlayError: Error {

    case invalidJSON
    case failedToEncodeURL

}


extension GoogleMapsTileOverlayError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .invalidJSON:        return "JSON file is not valid"
        case .failedToEncodeURL:  return "Failed to encode URL with percentage encoding"
        }
    }

}
