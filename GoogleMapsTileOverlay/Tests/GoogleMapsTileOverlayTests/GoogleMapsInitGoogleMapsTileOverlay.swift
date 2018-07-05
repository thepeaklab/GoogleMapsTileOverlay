//
//  GoogleMapsInitGoogleMapsTileOverlay.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 05.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
import MapKit
@testable import GoogleMapsTileOverlay


class GoogleMapsInitGoogleMapsTileOverlay: XCTestCase {

    let baseURL = "https://mts0.google.com/vt/lyrs=m@289000001&hl=en&src=app&x={x}&y={y}&z={z}&s=DGal"

    let exampleJson1 = """
      [
        {
          "featureType": "administrative.country",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        }
      ]
      """

    let exampleJson2 = """
    [
      {
        "featureType": "road.highway.controlled_access",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "labels",
        "stylers": [
          {
            "color": "#2B2B2B"
          },
          {
            "visibility": "simplified"
           }
        ]
      }
    ]
    """
}


extension GoogleMapsInitGoogleMapsTileOverlay {

    func testInitGoogleMapsTileOverlayWithBaseURL() {
        let tileOverlay = GoogleMapsTileOverlay()
        XCTAssertNotNil(tileOverlay)
        XCTAssertNotNil(tileOverlay.urlTemplate)
        XCTAssertEqual(tileOverlay.urlTemplate, self.baseURL)
    }

    func testInitGoogleMapsTileOverlayFromJsonString() {
        let tileOverlay = GoogleMapsTileOverlay(jsonString: exampleJson1)
        XCTAssertNotNil(tileOverlay)
        XCTAssertNotNil(tileOverlay?.urlTemplate)
        XCTAssertNotEqual(tileOverlay?.urlTemplate, self.baseURL)
    }

    func testInitGoogleMapsTileOVerlayFromJsonURL() {
        let jsonURL = Bundle(for: GoogleMapsInitGoogleMapsTileOverlay.self).url(forResource: "TestMapStyle",
                                                                                withExtension: "json")
        XCTAssertNotNil(jsonURL)
        let tileOverlay = GoogleMapsTileOverlay(jsonURL: jsonURL!)
        XCTAssertNotNil(tileOverlay)
        XCTAssertNotNil(tileOverlay?.urlTemplate)
        XCTAssertNotEqual(tileOverlay?.urlTemplate, self.baseURL)
    }

}
