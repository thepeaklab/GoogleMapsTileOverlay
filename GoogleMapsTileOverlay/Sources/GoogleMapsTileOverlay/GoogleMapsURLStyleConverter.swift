//
//  GoogleMapsURLStyleConverter.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation


internal class GoogleMapsURLStyleConverter {

    class func urlStringFrom(styles: [GoogleMapsStyle]) -> String {
        var urlString = ""

        for (index, style) in styles.enumerated() {
            urlString.append(style.convertedStyle())
            if index != styles.endIndex {
                urlString.append(",")
            }
        }
        if urlString.hasSuffix(",") {
            urlString.removeLast()
        }
        return urlString
    }

    class func encodedURLString(urlString: String) throws -> String {
        if var encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
            encodedString = encodedString.replacingOccurrences(of: ":", with: "%3A")
            encodedString = encodedString.replacingOccurrences(of: ",", with: "%2C")
            return encodedString
        } else {
            throw GoogleMapsTileOverlayError.failedToEncodeURL
        }
    }

}
