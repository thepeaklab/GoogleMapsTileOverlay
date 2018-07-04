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
        guard let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: data) else { return nil }

        let styleURL = GoogleMapsURLStyleConverter.urlStringFrom(styles: mapStyles)
        let encodedURL = GoogleMapsURLStyleConverter.encodedURLString(urlString: styleURL)
        super.init(urlTemplate: templateURL + "&apistyle=" + encodedURL)
    }

    public init?(jsonURL url: URL) {
        guard let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: Data(contentsOf: url))
        else { return nil }

        let styleURL = GoogleMapsURLStyleConverter.urlStringFrom(styles: mapStyles)
        let encodedURL = GoogleMapsURLStyleConverter.encodedURLString(urlString: styleURL)
        super.init(urlTemplate: templateURL + "&apistyle=" + encodedURL)
    }

}
