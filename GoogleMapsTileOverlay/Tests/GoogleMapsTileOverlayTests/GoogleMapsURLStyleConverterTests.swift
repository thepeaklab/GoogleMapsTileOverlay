//
//  GoogleMapsURLStyleConverterTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsURLStyleConverterTests: XCTestCase {

    func testConvertedURLShouldHaveCommaBetweenEveryFeatureType() {

        let styles = [GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")]),
                      GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")]),
                      GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")])]

        let convertedStyle = GoogleMapsURLStyleConverter.urlStringFrom(styles: styles)
        let expectedStyle = "s.t:0|p.v:on,s.t:0|p.v:on,s.t:0|p.v:on"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

}
