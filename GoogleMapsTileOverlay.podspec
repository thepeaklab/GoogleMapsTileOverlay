#
#  Be sure to run `pod spec lint GoogleMapsTileOverlay.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "GoogleMapsTileOverlay"
  spec.version      = "0.4.1"
  spec.summary      = "GoogleMapsTileOverlay lets you customize Apple Maps MKMapView with the Google Maps StylingWizard."
  spec.description  = "GoogleMapsTileOverlay
  lets you customize Apple Maps MKMapView with overlays from the Google Maps StylingWizard.
  This gives you complete freedom in styling the maps while using the MapKit Framework."

  spec.homepage     = "https://github.com/thepeaklab/GoogleMapsTileOverlay"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => "MIT" }
  spec.author       = { "the peak lab" => "sw@thepeaklab.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.ios.deployment_target = "8.4"
  spec.osx.deployment_target = "10.13"
  spec.tvos.deployment_target = "9.2"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/thepeaklab/GoogleMapsTileOverlay.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.swift_version = "5.0"
  spec.source_files  = "Sources", "Sources/**/*.{swift}"

end
