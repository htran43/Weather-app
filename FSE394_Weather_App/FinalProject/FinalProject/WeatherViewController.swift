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
    @IBOutlet var cityOutlet: UILabel!
    @IBOutlet var dateOutlet: UILabel!
    
    @IBOutlet var tempOutlet: UILabel!
    @IBOutlet var minTempOutlet: UILabel!
    @IBOutlet var maxTempOutlet: UILabel!
    @IBOutlet var windSpeedOutlet: UILabel!
    @IBOutlet var humidityOutlet: UILabel!
    //this stores info from the api call to be displayed on weather page
    struct Forecast: Decodable {
        struct Daily: Decodable {
            struct Temp: Decodable {
                let day: Double
                let min: Double
                let max: Double
            }
            let temp: Temp
            let humidity: Int
            let wind_speed: Double
        }
        let daily: [Daily]
    }
    
    //variable to get location, as well as variables to store said information
    let locationManager = CLLocationManager()
    var latitude: Double = 0
    var longitude: Double = 0
    var tempDay: Double = 0
    var minTemp: Double = 0
    var maxTemp: Double = 0
    var windSpeed: Double = 0
    var humidity: Int = 0
    
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
        
        updateDate()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tempOutlet.text = String(format: "%.0f°", self.tempDay)
            self.minTempOutlet.text = String(format: "%.0f°", self.minTemp)
            self.maxTempOutlet.text = String(format: "%.0f°", self.maxTemp)
            self.windSpeedOutlet.text = String(format: "%.0fm/s", self.windSpeed)
            self.humidityOutlet.text = String(format: "%.0i%%", self.humidity)
        }
    }
    
    func updateDate() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.dateOutlet.text = "Today, " + dateFormatter.string(from: date)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations =  \(locValue.latitude) \(locValue.longitude)")
        
        if let lastLocation = locations.last {
            let geocoder = CLGeocoder()
            
            geocoder.reverseGeocodeLocation(lastLocation) { [weak self] (placemarks, error) in
                if error == nil {
                    if let firstLocation = placemarks?[0],
                       let cityName = firstLocation.locality {
                        self?.locationManager.stopUpdatingLocation()
                        self!.cityOutlet.text = cityName
                    }
                }
                
            }
        }
        
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
                self.minTemp = foreCast.daily[0].temp.min
                self.maxTemp = foreCast.daily[0].temp.max
                self.windSpeed = foreCast.daily[0].wind_speed
                self.humidity = foreCast.daily[0].humidity
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
