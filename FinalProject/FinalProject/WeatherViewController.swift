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
    //this stores info from the api call to be displayed on weather page
    struct Forecast: Decodable {
        struct Daily: Decodable {
            struct Temp: Decodable {
                let day: Double
            }
            let temp: Temp
            let humidity: Int
        }
        let daily: [Daily]
    }
    
    //variable to get location, as well as variables to store said information
    let locationManager = CLLocationManager()
    var latitude: Double = 0
    var longitude: Double = 0
    var tempDay: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ask user for authorization
        self.locationManager.requestAlwaysAuthorization()
        
        //for use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        //if user enables location, find their location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        print(tempDay)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations =  \(locValue.latitude) \(locValue.longitude)")
        latitude = locValue.latitude
        longitude = locValue.longitude
        callAPI(latitude: latitude, longitude: longitude)
    }

    func callAPI(latitude: Double, longitude: Double) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&units=imperial&exclude=current,minutely,hourly&appid=14209ad437f68c36d342053e91596f8f") else {
            print("dang")
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print(string)
                let jsonData = string.data(using: .utf8)!
                let foreCast: Forecast = try! JSONDecoder().decode(Forecast.self, from: jsonData)
                self.tempDay = foreCast.daily[0].temp.day
                print(self.tempDay)
            }
        }
        task.resume()
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
