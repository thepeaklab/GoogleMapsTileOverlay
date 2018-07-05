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

    func testEncodedURLShouldNotHaveCommasOrSeperators() {
        let styles = [GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")]),
                      GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")]),
                      GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")])]

        let convertedStyle = GoogleMapsURLStyleConverter.urlStringFrom(styles: styles)

        if let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLString(urlString: convertedStyle) {
            XCTAssertFalse(encodedURL.contains(","))
            XCTAssertFalse(encodedURL.contains("|"))
        } else {
            XCTFail()
        }
    }

    func testEncodedURLShouldHaveEncodedCommas() {
        let url = ","
        let expectededURL = "%2C"

        if let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLString(urlString: url) {
            XCTAssertEqual(encodedURL, expectededURL)
        } else {
            XCTFail()
        }
    }

    func testEncodedURLShouldHaveEncodedSeperator() {
        let url = "|"
        if let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLString(urlString: url) {
            let expectededURL = "%7C"
            XCTAssertEqual(encodedURL, expectededURL)
        } else {
            XCTFail()
        }
    }

    func testEncodedURLShouldHaveEncodedColon() {
        let url = ":"
        if let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLString(urlString: url) {
            let expectededURL = "%3A"
            XCTAssertEqual(encodedURL, expectededURL)
        } else {
            XCTFail()
        }
    }
    
}
