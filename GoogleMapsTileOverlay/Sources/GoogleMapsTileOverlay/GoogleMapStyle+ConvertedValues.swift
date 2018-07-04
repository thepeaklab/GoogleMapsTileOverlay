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
        var converted = ""

        if let feature = convertedFeature() {
            converted.append(feature)
            converted.append("|")
        }
        if let element = convertedElement() {
            converted.append(element)
            converted.append("|")
        }
        for style in convertedStylers() {
            if converted.last != "|" && converted.last != "," {
                converted.append("|")
            }
            converted.append(style)
        }
        return converted
    }

}


private extension GoogleMapsStyle {

    func convertedFeature() -> String? {
        guard self.featureType != nil else { return nil }
        let key = "s.t:"
        switch self.featureType {
        case "all"                         : return key + "0"
        case "administrative"              : return key + "1"
        case "administrative.country"      : return key + "17"
        case "administrative.land_parcel"  : return key + "21"
        case "administrative.locality"     : return key + "19"
        case "administrative.neighborhood" : return key + "20"
        case "administrative.province"     : return key + "18"
        case "landscape"                   : return key + "5"
        case "landscape.man_made"          : return key + "81"
        case "landscape.natural"           : return key + "82"
        case "poi"                         : return key + "2"
        case "poi.attraction"              : return key + "37"
        case "poi.business"                : return key + "33"
        case "poi.government"              : return key + "34"
        case "poi.medical"                 : return key + "36"
        case "poi.park"                    : return key + "40"
        case "poi.place_of_worship"        : return key + "38"
        case "poi.school"                  : return key + "35"
        case "poi.sports_complex"          : return key + "39"
        case "road"                        : return key + "3"
        case "road.arterial"               : return key + "50"
        case "road.highway"                : return key + "49"
        case "road.local"                  : return key + "51"
        case "transit"                     : return key + "4"
        case "transit.line"                : return key + "65"
        case "transit.station"             : return key + "66"
        case "water"                       : return key + "6"
        default                            : return key + "undefined"
        }
    }

    func convertedElement() -> String? {
        guard self.elementType != nil else { return nil }
        let key = "s.e:"
        switch self.elementType {
        case "all"                 : return key + "a"
        case "geometry"            : return key + "g"
        case "geometry.fill"       : return key + "g.f"
        case "geometry.stroke"     : return key + "g.s"
        case "labels"              : return key + "l"
        case "labels.icon"         : return key + "l.i"
        case "labels.text"         : return key + "l.t"
        case "labels.text.fill"    : return key + "l.t.f"
        case "labels.text.stroke"  : return key + "l.t.s"
        default                    : return key + "undefined"
        }
    }

    func convertedStylers() -> [String] {
        var styles = [String]()
        guard let stylers = stylers else { return styles }

        for styler in stylers {

            if let color = styler.color {
                if color.count == 7 {
                    styles.append("p.c:#ff\(color.replacingOccurrences(of: "#", with: ""))")
                } else {
                    styles.append("p.c:\(color)")
                }
            }

            if let gamma = styler.gamma                     { styles.append("p.g:\(gamma)") }
            if let hue = styler.hue                         { styles.append("p.h:\(hue)") }
            if let invertLightness = styler.invertLightness { styles.append("p.il:\(invertLightness)") }
            if let lightness = styler.invertLightness       { styles.append("p.l:\(lightness)") }
            if let saturation = styler.saturation           { styles.append("p.s:\(saturation)") }
            if let visibility = styler.visibility           { styles.append("p.v:\(visibility)") }
            if let weight = styler.weight                   { styles.append("p.w:\(weight)") }
        }
        return styles
    }

}
