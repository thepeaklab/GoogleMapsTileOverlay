//
//  GoogleMapsTileOverlayConvertStylerTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsTileOverlayConvertStylerTests: XCTestCase {

    func testConvertStylerColor() {
        let colorString = "#75B6B6"
        let expectedColorString = "#ff75B6B6"
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(color: colorString)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.c:\(expectedColorString)"))
    }

    func testConvertStylerGamma() {
        let gammaString = "15"
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(gamma: gammaString)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.g:\(gammaString)"))
    }

    func testConvertStylerHue() {
        let hueString = "15"
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(hue: hueString)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.h:\(hueString)"))
    }

    func testConvertStylerInvertLightnessOn() {
        let invertLightnessString = "on"
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(invertLightness: invertLightnessString)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.il:\(invertLightnessString)"))
    }

    func testConvertStylerLightness() {
        let lightnessValue = 15
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(lightness: lightnessValue)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.l:\(lightnessValue)"))
    }

    func testConvertStylerSaturation() {
        let saturationValue = -15
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(saturation: saturationValue)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.s:\(saturationValue)"))
    }

    func testConvertStylerVisibilityOn() {
        let onString = "on"
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(visibility: onString)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.v:\(onString)"))
    }

    func testConvertStylerWeight() {
        let weightValue = 3.5
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(weight: weightValue)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.w:\(weightValue)"))
    }

}
