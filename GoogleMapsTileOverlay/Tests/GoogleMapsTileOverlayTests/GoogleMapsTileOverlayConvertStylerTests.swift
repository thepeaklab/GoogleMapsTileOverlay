//
//  GoogleMapsTileOverlayConvertStylerTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsTileOverlayConvertStylerTests: GoogleMapsTileOverlayBaseTestCase {

    func testConvertStylerVisibilityOn() {
        let onString = "on"
        let style = GoogleMapsStyle(featureType: "all", elementType: nil, stylers: [Styler(visibility: onString)])
        let convertedStyle = style.convertedStyle()
        XCTAssertTrue(convertedStyle.hasPrefix("s.t:0|p.v:\(onString)"))
    }

}
