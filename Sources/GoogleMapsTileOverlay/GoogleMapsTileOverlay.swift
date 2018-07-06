//
//  GoogleMapsTileOverlay.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation
import MapKit


/// Customizable GoogleMaps TileOverlay for MKMapView
public class GoogleMapsTileOverlay: MKTileOverlay {

    private let templateURL = "https://mts0.google.com/vt/lyrs=m@289000001&hl=en&src=app&x={x}&y={y}&z={z}&s=DGal"
    private let stylePrefix = "&apistyle="

    /// Returns TileOverlay with basic Google Maps Style
    public init() {
        super.init(urlTemplate: templateURL)
    }

    /// Returns GoogleMapsTileOverlay with custom GoogleMaps style as Json string
    ///
    /// - Parameter string: Custom Google Maps Style from StylingWizard in json format
    /// - Throws: `GoogleMapsTileOverlayError.invalidJson` if the json string is malformatted
    public init(jsonString string: String) throws {
        guard let jsonData = string.data(using: .utf8),
            let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: jsonData)
        else {
            throw GoogleMapsTileOverlayError.invalidJSON
        }

        let convertedStyle = GoogleMapsURLStyleConverter.convertedStyleFrom(styles: mapStyles)
        let encodedURL = try GoogleMapsURLStyleConverter.encodedURLStringFrom(urlString: convertedStyle)
        super.init(urlTemplate: templateURL + stylePrefix + encodedURL)
    }

    /// Returns GoogleMapsTileOverlay with custom GoogleMaps style from Json URL
    ///
    /// - Parameter url: Custom Google Maps Style from local or remote Json file
    /// - Throws: `GoogleMapsTileOverlayError.invalidJson` if the json file is malformatted
    public convenience init(jsonURL url: URL) throws {
        try self.init(jsonString: String(contentsOf: url))
    }

}
