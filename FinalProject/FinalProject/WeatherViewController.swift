//
//  WeatherViewController.swift
//  FinalProject
//
//  Created by FSE394 on 4/13/22.
//

import UIKit
import CoreLocation
import MapKit

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    struct Forecast: Codable {
        struct Temp: Codable {
            let min: Double
            let max: Double
        }
        let temp: Temp
        let humidity: Int
        struct Weather: Codable {
            let id: Int
            let description: String
            let icon: String
            var weatherIconURL: URL {
                let urlString = "http://openweathermap.org/img/wn/\(icon)10d@2x.png"
                return URL(string: urlString)!
            }
        }
        let clouds: Int
        let pop: Double
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ask user for authorization
        self.locationManager.requestAlwaysAuthorization()
        
        //for use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations =  \(locValue.latitude) \(locValue.longitude)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
