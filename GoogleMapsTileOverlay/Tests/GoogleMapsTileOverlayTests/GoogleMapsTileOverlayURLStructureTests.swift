//
//  GoogleMapsTileOverlayURLStructureTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsTileOverlayURLStructureTests: XCTestCase {

    func testURLHasSeperatorAfterFeatureType() {
        let style = GoogleMapsStyle(featureType: "all")
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasSuffix("|"))
    }

    func testURLHasSeperatorAfterElementType() {
        let style = GoogleMapsStyle(elementType: "all")
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasSuffix("|"))
    }

    func testURLHasSeperatorAfterEveryStylerExceptTheLastOne() {
        let style = GoogleMapsStyle(featureType: "all", stylers: [Styler(visibility: "on"),
                                              Styler(visibility: "on"),
                                              Styler(visibility: "on"),
                                              Styler(visibility: "on")])
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:0|p.v:on|p.v:on|p.v:on|p.v:on"

        XCTAssertEqual(convertedStyle, expectedStyle)
    }

}
