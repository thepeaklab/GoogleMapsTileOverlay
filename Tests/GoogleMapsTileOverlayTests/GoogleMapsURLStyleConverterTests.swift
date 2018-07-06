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

        let convertedStyle = GoogleMapsURLStyleConverter.convertedStyleFrom(styles: styles)
        let expectedStyle = "s.t:0|p.v:on,s.t:0|p.v:on,s.t:0|p.v:on"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testEncodedURLShouldNotHaveCommasOrSeperators() {
        let styles = [GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")]),
                      GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")]),
                      GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on")])]

        let convertedStyle = GoogleMapsURLStyleConverter.convertedStyleFrom(styles: styles)

        let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLStringFrom(urlString: convertedStyle)
        XCTAssertNotNil(encodedURL)
        XCTAssertFalse(encodedURL!.contains(","))
        XCTAssertFalse(encodedURL!.contains("|"))
    }

    func testEncodedURLShouldHaveEncodedCommas() {
        let url = ","
        let expectededURL = "%2C"

        let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLStringFrom(urlString: url)
        XCTAssertEqual(encodedURL, expectededURL)
    }

    func testEncodedURLShouldHaveEncodedSeperator() {
        let url = "|"
        let expectededURL = "%7C"

        let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLStringFrom(urlString: url)
        XCTAssertEqual(encodedURL, expectededURL)
    }

    func testEncodedURLShouldHaveEncodedColon() {
        let url = ":"
        let expectededURL = "%3A"

        let encodedURL = try? GoogleMapsURLStyleConverter.encodedURLStringFrom(urlString: url)
        XCTAssertEqual(encodedURL, expectededURL)
    }

    func testEncodedURLStringFromInvalidUnicodeStringsShouldThrowFailedToEncodeURLError() {
        let invalidUnicodeString = String(bytes: [0xD8, 0x00] as [UInt8],
                                          encoding: String.Encoding.utf16BigEndian)!
        do {
            _ = try GoogleMapsURLStyleConverter.encodedURLStringFrom(urlString: invalidUnicodeString)
        } catch let error {
            let overlayError = (error as? GoogleMapsTileOverlayError)
            XCTAssertEqual(overlayError, GoogleMapsTileOverlayError.failedToEncodeURL)
            XCTAssertNotEqual(overlayError?.localizedDescription, "")
        }
    }

}
