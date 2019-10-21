# GoogleMapsTileOverlay for MapKit

![Swift Version](https://img.shields.io/badge/Swift-4.1.2-orange.svg)
![PackageManager](https://img.shields.io/badge/PackageManager-Carthage-brightgreen.svg?style=flat)
![Cocoapods](https://img.shields.io/cocoapods/p/GoogleMapsTileOverlay?label=pod)
![Platforms](https://img.shields.io/badge/Platforms-iOS|tvOS|macOS-yellow.svg?style=flat)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/thepeaklab/GoogleMapsTileOverlay/blob/master/LICENSE)
[![Twitter: @thepeaklab](https://img.shields.io/badge/contact-@thepeaklab-009fee.svg?style=flat)](https://twitter.com/thepeaklab)

GoogleMapsTileOverlay lets you customize Apple Maps [MKMapView](https://developer.apple.com/documentation/mapkit?changes=_8) with the [Google Maps StylingWizard](https://mapstyle.withgoogle.com).


## Install

### Carthage

To install `GoogleMapsTileOverlay ` with Carthage, setup Carthage for your project as described in the [Quick Start](https://github.com/Carthage/Carthage#quick-start).

Then add this line to your Cartfile:

```
github "thepeaklab/GoogleMapsTileOverlay" ~> 0.4.1
```

### CocoaPods

Install [CocoaPods](http://cocoapods.org) if you haven't already

Add this in your `Podfile` for your target:

```
pod 'GoogleMapsTileOverlay', '~> 0.4.1'
```
And install with:

```
pod install
```

## Example
You can customize Apple Maps to match the design of your App or Game:

[Example Project](Example)

<img src="Example/Screenshot1.png" height="400"> <img src="Example/Screenshot2.png" height="400"> <img src="Example/Screenshot3.png" height="400"> <img src="Example/Screenshot4.png" height="400"> <img src="Example/Screenshot6.png" height="400"> <img src="Example/Screenshot5.png" height="400">

## Usage

1. Create MapStyle with the [Google Maps StylingWizard](https://mapstyle.withgoogle.com) and save it to a JSON-File
2. Add JSON-File to your XCode Project
3. In your ViewController:

```swift
import GoogleMapsTileOverlay
```

#### Add custom overlay to your MKMapView:

```swift
guard let jsonURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") else { return }

let tileOverlay = try? GoogleMapsTileOverlay(jsonURL: jsonURL)
tileOverlay.canReplaceMapContent = true
mapView.addOverlay(tileOverlay, level: .aboveRoads)
```

#### Add delegate for your MKMapView:

```swift
mapView.delegate = self
```

```swift
extension YourViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let tileOverlay = overlay as? MKTileOverlay {
            return MKTileOverlayRenderer(tileOverlay: tileOverlay)
        }
        return MKOverlayRenderer(overlay: overlay)
    }

}
```

## Known Issues

1. [Labels in iOS 13](https://github.com/thepeaklab/GoogleMapsTileOverlay/issues/6) On iOS 13 the labels on the map and the annotations are not visible, even when using the level **aboveRoads**. This bug is already reported to Apple and will hopefully be solved in future versions of iOS.

## Need Help?

Please [submit an issue](https://github.com/thepeaklab/GoogleMapsTileOverlay/issues) on GitHub.

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file.
