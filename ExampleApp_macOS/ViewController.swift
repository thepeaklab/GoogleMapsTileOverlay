//
//  ViewController.swift
//  ExampleApp_macOS
//
//  Created by Sandro Wehrhahn on 10.07.18.
//  Copyright © 2018 the peak lab. gmbh & co. kg. All rights reserved.
//

import Cocoa
import MapKit
import GoogleMapsTileOverlay


class ViewController: NSViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addCustomOverlay()
    }

    private func addCustomOverlay() {
        guard let jsonURL = Bundle.main.url(forResource: "LightBlueGreen", withExtension: "json") else { return }

        do {
            let gmTileOverlay = try GoogleMapsTileOverlay(jsonURL: jsonURL)
            gmTileOverlay.canReplaceMapContent = true
            mapView.addOverlay(gmTileOverlay)
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
