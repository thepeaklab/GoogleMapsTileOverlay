//
//  GoogleMapsTileOverlay.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation
import MapKit


public class GoogleMapsStyleTileOverlay: MKTileOverlay {

    private let templateURL = "https://mts0.google.com/vt/lyrs=m@289000001&hl=en&src=app&x={x}&y={y}&z={z}&s=DGal"

    public init() {
        super.init(urlTemplate: templateURL)
    }

    public init?(jsonString string: String) {
        guard let data = string.data(using: .utf8) else { return nil }
        guard let styles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: data) else { return nil }

        let styleURL = GoogleMapsStyleTileOverlay.createURLFrom(styles: styles)
        super.init(urlTemplate: templateURL+styleURL)
    }

    public init?(jsonURL url: URL) {
        guard let styles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: Data(contentsOf: url))
        else { return nil }

        let styleURL = GoogleMapsStyleTileOverlay.createURLFrom(styles: styles)
        super.init(urlTemplate: templateURL+styleURL)
    }

}

private extension GoogleMapsStyleTileOverlay {

    class func createURLFrom(styles: [GoogleMapsStyle]) -> String {
        var urlString = ""

        for (index, style) in styles.enumerated() {
            urlString.append(style.convertedStyle())
            if index != styles.endIndex {
                urlString.append(",")
            }
        }

        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        urlString = urlString.replacingOccurrences(of: ":", with: "%3A")
        urlString = urlString.replacingOccurrences(of: ",", with: "%2C")

        return "&apistyle=\(urlString)"
    }

}
