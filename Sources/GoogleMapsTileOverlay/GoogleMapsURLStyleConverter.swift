//
//  GoogleMapsURLStyleConverter.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation


internal class GoogleMapsURLStyleConverter {

    class func convertedStyleFrom(styles: [GoogleMapsStyle]) -> String {
        return styles.map { $0.convertedStyle() }.joined(separator: ",")
    }

    class func encodedURLStringFrom(urlString: String) throws -> String {
        guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            throw GoogleMapsTileOverlayError.failedToEncodeURL
        }
        return encodedString.replacingOccurrences(of: ":", with: "%3A")
                            .replacingOccurrences(of: ",", with: "%2C")
    }

}
