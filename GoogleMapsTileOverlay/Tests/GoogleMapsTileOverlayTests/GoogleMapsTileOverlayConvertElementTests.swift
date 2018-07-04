//
//  GoogleMapsTileOverlayConvertElementTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsTileOverlayConvertElementTests: XCTestCase {

    func testConvertElementAll() {
        let style = GoogleMapsStyle(elementType: "all")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:a|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementGeometry() {
        let style = GoogleMapsStyle(elementType: "geometry")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:g|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementGeometryFill() {
        let style = GoogleMapsStyle(elementType: "geometry.fill")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:g.f|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementGeometryStroke() {
        let style = GoogleMapsStyle(elementType: "geometry.stroke")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:g.s|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementLabels() {
        let style = GoogleMapsStyle(elementType: "labels")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:l|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementLabelsIcon() {
        let style = GoogleMapsStyle(elementType: "labels.icon")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:l.i|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementLabelsText() {
        let style = GoogleMapsStyle(elementType: "labels.text")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:l.t|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementLabelsTextFill() {
        let style = GoogleMapsStyle(elementType: "labels.text.fill")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:l.t.f|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementLabelsTextStroke() {
        let style = GoogleMapsStyle(elementType: "labels.text.stroke")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:l.t.s|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertElementUndefined() {
        let style = GoogleMapsStyle(elementType: "foobar")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.e:undefined|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }
    
}
