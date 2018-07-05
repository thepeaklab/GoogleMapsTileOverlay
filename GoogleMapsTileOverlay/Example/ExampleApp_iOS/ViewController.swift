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
    }

    private func addCustomOverlay() {
        guard let jsonURL = Bundle.main.url(forResource: "ExampleMapStyle", withExtension: "json") else { return }
        do {
            let gmTileOverlay = try GoogleMapsTileOverlay(jsonURL: jsonURL)
            gmTileOverlay.canReplaceMapContent = true
            mapView.add(gmTileOverlay)
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
