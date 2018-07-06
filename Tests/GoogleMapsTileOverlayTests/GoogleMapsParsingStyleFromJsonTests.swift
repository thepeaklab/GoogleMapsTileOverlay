//
//  GoogleMapsParsingStyleFromJsonTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 05.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsParsingStyleFromJsonTests: XCTestCase {

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
    
}


extension GoogleMapsParsingStyleFromJsonTests {
    
    func testParsingValidJsonWithOneObjectShouldReturnOneGoogleMapsStyle() {
        guard let jsonData = validJson1.data(using: .utf8) else {
            XCTFail("Failed to convert JsonString to Data")
            return
        }
        guard let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: jsonData) else {
            XCTFail("Failed to decode JsonData")
            return
        }
        XCTAssertEqual(mapStyles.count, 1)
        XCTAssertEqual(mapStyles[0].featureType, "administrative.country")
        XCTAssertNil(mapStyles[0].elementType)
        XCTAssertNotNil(mapStyles[0].stylers)
        XCTAssertEqual(mapStyles[0].stylers?.count, 1)
        XCTAssertEqual(mapStyles[0].stylers?[0].visibility, "off")
    }

    func testParsingValidJsonWithTwoObjectsShouldReturnTwoGoogleMapsStyles() {
        guard let jsonData = validJson2.data(using: .utf8) else {
            XCTFail("Failed to convert JsonString to Data")
            return
        }
        guard let mapStyles = try? JSONDecoder().decode([GoogleMapsStyle].self, from: jsonData) else {
            XCTFail("Failed to decode JsonData")
            return
        }
        XCTAssertEqual(mapStyles.count, 2)

        XCTAssertEqual(mapStyles[0].featureType, "road.highway.controlled_access")
        XCTAssertNil(mapStyles[0].elementType)
        XCTAssertNotNil(mapStyles[0].stylers)
        XCTAssertEqual(mapStyles[0].stylers?[0].visibility, "on")

        XCTAssertEqual(mapStyles[1].featureType, "road.highway")
        XCTAssertEqual(mapStyles[1].elementType, "labels")
        XCTAssertEqual(mapStyles[1].stylers?.count, 2)
        XCTAssertEqual(mapStyles[1].stylers?[0].color, "#2B2B2B")
        XCTAssertEqual(mapStyles[1].stylers?[1].visibility, "simplified")
    }

}
