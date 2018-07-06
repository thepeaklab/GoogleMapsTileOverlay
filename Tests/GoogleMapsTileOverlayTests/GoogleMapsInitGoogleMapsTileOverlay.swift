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

    let validJson1 = """
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

    let validJson2 = """
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

    let invalidJson = """
      }

          "featureType": "administrative.country",
          "stylers": [
            {
              "visibility": "off"
      """

    let wrongFormattedJson = """
        {
          "featureType": "administrative.country",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        }
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
        let tileOverlay = try? GoogleMapsTileOverlay(jsonString: validJson1)
        XCTAssertNotNil(tileOverlay)
        XCTAssertNotNil(tileOverlay?.urlTemplate)
        XCTAssertNotEqual(tileOverlay?.urlTemplate, self.baseURL)
    }

    func testInitGoogleMapsTileOverlayFromJsonURL() {
        let jsonURL = Bundle(for: GoogleMapsInitGoogleMapsTileOverlay.self).url(forResource: "TestMapStyle",
                                                                                withExtension: "json")
        XCTAssertNotNil(jsonURL)
        let tileOverlay = try? GoogleMapsTileOverlay(jsonURL: jsonURL!)
        XCTAssertNotNil(tileOverlay)
        XCTAssertNotNil(tileOverlay?.urlTemplate)
        XCTAssertNotEqual(tileOverlay?.urlTemplate, self.baseURL)
    }

    func testInitGoogleMapsTileOverlayWithInvalidJsonShouldReturnInvalidJsonError() {
        do {
           _ = try GoogleMapsTileOverlay(jsonString: invalidJson)
        } catch let error {
            let overlayError = (error as? GoogleMapsTileOverlayError)
            XCTAssertEqual(overlayError, GoogleMapsTileOverlayError.invalidJSON)
            XCTAssertNotEqual(overlayError?.localizedDescription, "")
        }
    }

    func testInitGoogleMapsTileOverlayWithWrongFormattedJsonStringShouldReturnInvalidJsonError() {
        do {
            _ = try GoogleMapsTileOverlay(jsonString: wrongFormattedJson)
        } catch let error {
            let overlayError = (error as? GoogleMapsTileOverlayError)
            XCTAssertEqual(overlayError, GoogleMapsTileOverlayError.invalidJSON)
            XCTAssertNotEqual(overlayError?.localizedDescription, "")
        }
    }

    func testInitGoogleMapsTileOverlayWithWrongFormattedJsonFileShouldReturnInvalidJsonError() {
        let bundle = Bundle(for: GoogleMapsInitGoogleMapsTileOverlay.self)
        guard let wrongFormattedJsonURL = bundle.url(forResource: "InvalidTestMapStyle", withExtension: "json")
        else {
            XCTFail()
            return
        }

        do {
            _ = try GoogleMapsTileOverlay(jsonURL: wrongFormattedJsonURL)
        } catch let error {
            let overlayError = (error as? GoogleMapsTileOverlayError)
            XCTAssertEqual(overlayError, GoogleMapsTileOverlayError.invalidJSON)
            XCTAssertNotEqual(overlayError?.localizedDescription, "")
        }
    }

}
