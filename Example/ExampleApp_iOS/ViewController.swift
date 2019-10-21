//
//  ViewController.swift
//  ExampleApp_iOS
//
//  Created by Sandro Wehrhahn on 04.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import UIKit
import MapKit
import GoogleMapsTileOverlay


class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        addCustomOverlay()

        let annotation = SampleAnnotation(coordinate: CLLocationCoordinate2D(latitude: 53.141351, longitude: 8.229935),
                                          title: "the peak lab.",
                                          subtitle: "Office")
        mapView.addAnnotation(annotation)
    }

    private func addCustomOverlay() {
        guard let jsonURL = Bundle.main.url(forResource: "LightBlueGreen", withExtension: "json") else { return }

        do {
            let gmTileOverlay = try GoogleMapsTileOverlay(jsonURL: jsonURL)
            gmTileOverlay.canReplaceMapContent = true
            mapView.addOverlay(gmTileOverlay, level: .aboveRoads)
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let tileOverlay = overlay as? MKTileOverlay {
            return MKTileOverlayRenderer(tileOverlay: tileOverlay)
        }
        return MKOverlayRenderer(overlay: overlay)
    }

}

class SampleAnnotation: NSObject, MKAnnotation {

    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?

    public init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
