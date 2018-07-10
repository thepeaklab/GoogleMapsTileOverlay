//
//  GoogleMapsStyle+ConvertedValues.swift
//  GoogleMapsTileOverlay
//
//  Created by Sandro Wehrhahn on 03.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Foundation


internal extension GoogleMapsStyle {

    func convertedStyle() -> String {
        let mapStylers = convertedStylers().joined(separator: "|")
        return "\(convertedFeature() ?? "")\(convertedElement() ?? "")\(mapStylers)"
    }

}


private extension GoogleMapsStyle {

    func convertedFeature() -> String? {
        guard featureType != nil else { return nil }
        let key = "s.t:"
        let sep = "|"

        switch featureType {
        case "all"                            : return key + "0" + sep
        case "administrative"                 : return key + "1" + sep
        case "administrative.country"         : return key + "17" + sep
        case "administrative.province"        : return key + "18" + sep
        case "administrative.locality"        : return key + "19" + sep
        case "administrative.neighborhood"    : return key + "20" + sep
        case "administrative.land_parcel"     : return key + "21" + sep
        case "landscape"                      : return key + "5" + sep
        case "landscape.man_made"             : return key + "81" + sep
        case "landscape.natural"              : return key + "82" + sep
        case "landscape.natural.landcover"    : return key + "1313" + sep
        case "landscape.natural.terrain"      : return key + "1314" + sep
        case "poi"                            : return key + "2" + sep
        case "poi.attraction"                 : return key + "37" + sep
        case "poi.business"                   : return key + "33" + sep
        case "poi.government"                 : return key + "34" + sep
        case "poi.medical"                    : return key + "36" + sep
        case "poi.park"                       : return key + "40" + sep
        case "poi.place_of_worship"           : return key + "38" + sep
        case "poi.school"                     : return key + "35" + sep
        case "poi.sports_complex"             : return key + "39" + sep
        case "road"                           : return key + "3" + sep
        case "road.highway"                   : return key + "49" + sep
        case "road.highway.controlled_access" : return key + "785" + sep
        case "road.arterial"                  : return key + "50" + sep
        case "road.local"                     : return key + "51" + sep
        case "transit"                        : return key + "4" + sep
        case "transit.line"                   : return key + "65" + sep
        case "transit.station"                : return key + "66" + sep
        case "transit.station.airport"        : return key + "1059" + sep
        case "transit.station.bus"            : return key + "1058" + sep
        case "transit.station.rail"           : return key + "1057" + sep
        case "transit.station.ferry"          : return key + "1060" + sep
        case "water"                          : return key + "6" + sep
        default                               : return key + "undefined" + sep
        }
    }

    func convertedElement() -> String? {
        guard elementType != nil else { return nil }
        let key = "s.e:"
        let sep = "|"

        switch elementType {
        case "all"                 : return key + "a" + sep
        case "geometry"            : return key + "g" + sep
        case "geometry.fill"       : return key + "g.f" + sep
        case "geometry.stroke"     : return key + "g.s" + sep
        case "labels"              : return key + "l" + sep
        case "labels.icon"         : return key + "l.i" + sep
        case "labels.text"         : return key + "l.t" + sep
        case "labels.text.fill"    : return key + "l.t.f" + sep
        case "labels.text.stroke"  : return key + "l.t.s" + sep
        default                    : return key + "undefined" + sep
        }
    }

    func convertedStylers() -> [String] {
        var mapStylers = [String]()
        guard let stylers = stylers else { return mapStylers }

        for styler in stylers {
            if let color = styler.color {
                if color.count == 7 {
                    let colorWithoutHash = color.replacingOccurrences(of: "#", with: "")
                    mapStylers.append("p.c:#ff\(colorWithoutHash)")
                } else {
                    mapStylers.append("p.c:\(color)")
                }
            }
            if let gamma = styler.gamma                     { mapStylers.append("p.g:\(gamma)") }
            if let hue = styler.hue                         { mapStylers.append("p.h:\(hue)") }
            if let invertLightness = styler.invertLightness { mapStylers.append("p.il:\(invertLightness)") }
            if let lightness = styler.lightness             { mapStylers.append("p.l:\(lightness)") }
            if let saturation = styler.saturation           { mapStylers.append("p.s:\(saturation)") }
            if let visibility = styler.visibility           { mapStylers.append("p.v:\(visibility)") }
            if let weight = styler.weight                   { mapStylers.append("p.w:\(weight)") }
        }
        return mapStylers
    }

}
