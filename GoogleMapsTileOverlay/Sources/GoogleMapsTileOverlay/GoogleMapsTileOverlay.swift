//
//  GoogleMapsTileOverlay.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation
import MapKit


public class GoogleMapsTileOverlay: MKTileOverlay {

    private let templateURL = "https://mts0.google.com/vt/lyrs=m@289000001&hl=en&src=app&x={x}&y={y}&z={z}&s=DGal"

    public init() {
        super.init(urlTemplate: templateURL)
    }

    public init(jsonString string: String) throws {
        guard let jsonData = string.data(using: .utf8),
            let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: jsonData)
        else {
            throw GoogleMapsTileOverlayError.invalidJson
        }

        let styleURL = GoogleMapsURLStyleConverter.urlStringFrom(styles: mapStyles)
        let encodedURL = try GoogleMapsURLStyleConverter.encodedURLString(urlString: styleURL)
        super.init(urlTemplate: templateURL + "&apistyle=" + encodedURL)
    }

    public init(jsonURL url: URL) throws {
        guard let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: Data(contentsOf: url))
        else {
            throw GoogleMapsTileOverlayError.invalidJson
        }

        let styleURL = GoogleMapsURLStyleConverter.urlStringFrom(styles: mapStyles)
        let encodedURL = try GoogleMapsURLStyleConverter.encodedURLString(urlString: styleURL)
        super.init(urlTemplate: templateURL + "&apistyle=" + encodedURL)
    }

}
