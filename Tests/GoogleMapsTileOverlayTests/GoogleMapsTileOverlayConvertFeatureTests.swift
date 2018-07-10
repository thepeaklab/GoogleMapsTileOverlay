//
//  GoogleMapsTileOverlayTests.swift
//  GoogleMapsTileOverlayTests
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import XCTest
@testable import GoogleMapsTileOverlay


class GoogleMapsTileOverlayConvertFeatureTests: XCTestCase {
    
    func testConvertFeatureTypeAll() {
        let style = GoogleMapsStyle(featureType: "all")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:0|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeAdministrative() {
        let style = GoogleMapsStyle(featureType: "administrative")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeAdministrative_country() {
        let style = GoogleMapsStyle(featureType: "administrative.country")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:17|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeAdministrative_land_parcel() {
        let style = GoogleMapsStyle(featureType: "administrative.land_parcel")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:21|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeAdministrative_locality() {
        let style = GoogleMapsStyle(featureType: "administrative.locality")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:19|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeAdministrative_neighborhood() {
        let style = GoogleMapsStyle(featureType: "administrative.neighborhood")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:20|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeAdministrative_province() {
        let style = GoogleMapsStyle(featureType: "administrative.province")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:18|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeLandscape() {
        let style = GoogleMapsStyle(featureType: "landscape")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:5|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeLandscape_man_made() {
        let style = GoogleMapsStyle(featureType: "landscape.man_made")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:81|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeLandscape_natural() {
        let style = GoogleMapsStyle(featureType: "landscape.natural")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:82|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeLandscape_natural_landcover() {
        let style = GoogleMapsStyle(featureType: "landscape.natural.landcover")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1313|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeLandscape_natural_terrain() {
        let style = GoogleMapsStyle(featureType: "landscape.natural.terrain")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1314|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI() {
        let style = GoogleMapsStyle(featureType: "poi")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:2|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_attraction() {
        let style = GoogleMapsStyle(featureType: "poi.attraction")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:37|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_business() {
        let style = GoogleMapsStyle(featureType: "poi.business")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:33|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_government() {
        let style = GoogleMapsStyle(featureType: "poi.government")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:34|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_medical() {
        let style = GoogleMapsStyle(featureType: "poi.medical")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:36|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_park() {
        let style = GoogleMapsStyle(featureType: "poi.park")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:40|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_place_of_worship() {
        let style = GoogleMapsStyle(featureType: "poi.place_of_worship")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:38|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_school() {
        let style = GoogleMapsStyle(featureType: "poi.school")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:35|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypePOI_sports_complex() {
        let style = GoogleMapsStyle(featureType: "poi.sports_complex")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:39|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeRoad() {
        let style = GoogleMapsStyle(featureType: "road")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:3|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeRoad_arterial() {
        let style = GoogleMapsStyle(featureType: "road.arterial")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:50|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeRoad_highway() {
        let style = GoogleMapsStyle(featureType: "road.highway")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:49|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeRoad_highway_controlled_access() {
        let style = GoogleMapsStyle(featureType: "road.highway.controlled_access")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:785|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeRoad_local() {
        let style = GoogleMapsStyle(featureType: "road.local")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:51|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit() {
        let style = GoogleMapsStyle(featureType: "transit")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:4|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit_line() {
        let style = GoogleMapsStyle(featureType: "transit.line")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:65|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit_station() {
        let style = GoogleMapsStyle(featureType: "transit.station")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:66|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit_station_airport() {
        let style = GoogleMapsStyle(featureType: "transit.station.airport")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1059|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit_station_bus() {
        let style = GoogleMapsStyle(featureType: "transit.station.bus")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1058|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit_station_rail() {
        let style = GoogleMapsStyle(featureType: "transit.station.rail")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1057|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeTransit_station_ferry() {
        let style = GoogleMapsStyle(featureType: "transit.station.ferry")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:1060|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeWater() {
        let style = GoogleMapsStyle(featureType: "water")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:6|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

    func testConvertFeatureTypeUndefined() {
        let style = GoogleMapsStyle(featureType: "foobar")
        let convertedStyle = style.convertedStyle()
        let expectedStyle = "s.t:undefined|"
        XCTAssertEqual(convertedStyle, expectedStyle)
    }

}
