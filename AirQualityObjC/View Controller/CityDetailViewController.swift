//
//  CityDetailViewController.swift
//  AirQualityObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var airQualityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let country = country, let state = state, let city = city else {return}
        DVMCityAirQualityController.fetchData(forCity: country, state: state, city: city) { (airQuality) in
            self.updateViews(airQuality: airQuality)
        }
    }
    var country: String?
    var state: String?
    var city: String?
    
    func updateViews(airQuality: DVMCityAirQuality) {
        DispatchQueue.main.async {
            self.cityName.text = airQuality.city
            self.stateLabel.text = airQuality.state
            self.countryLabel.text = airQuality.country
            self.airQualityLabel.text = "Air Quality Index: \(airQuality.pollution.airQualityIndex)"
            self.tempLabel.text = "Temperature: \(airQuality.weather.temperature)"
            self.humidityLabel.text = "Humidity: \(airQuality.weather.humidity)"
            self.windspeedLabel.text = "Windspeed: \(airQuality.weather.windspeed)"
            self.title = self.city
        }
    }

}
