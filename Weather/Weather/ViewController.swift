//
//  ViewController.swift
//  Weather
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    private let apiKey = "0a542de480b1f1d31b0db390914083bc"
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tempImage: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    private var userLocation: CLLocation?
    
    private var temperature: Double?
    private var city: String?
    private var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        setupLocation()
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let city = searchTextField.text, !city.isEmpty {
            searchTextField.text = ""
            getWeatherUsingCity(cityName: city)
        }
        return true
    }

    @IBAction func searchUsingInput(_ sender: Any) {
        if let city = searchTextField.text, !city.isEmpty {
            searchTextField.text = ""
            getWeatherUsingCity(cityName: city)
        }
    }
    
    @IBAction func getUserLocation(_ sender: UIButton) {
        if let location = userLocation {
            getWeatherUsingCoordinates(lon: location.coordinate.longitude, lat: location.coordinate.latitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, userLocation == nil {
            userLocation = locations.first
            locationManager.stopUpdatingLocation()
            if let location = userLocation {
                getWeatherUsingCoordinates(lon: location.coordinate.longitude, lat: location.coordinate.latitude)
            }
        }
    }
    
    
    func getWeatherUsingCity(cityName: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("[⚠️] ERROR FETCHING WEATHER DATA FOR CITY: \(cityName)")
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(WeatherResult.self, from: data)
                DispatchQueue.main.async {
                    self?.temperature = jsonData.main.temp
                    self?.city = cityName.capitalized
                    self?.imageName = jsonData.weather.first?.condition.image
                    self?.updateUI()
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func getWeatherUsingCoordinates(lon: Double, lat: Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("[⚠️] ERROR FETCHING WEATHER DATA USING COORDINATES")
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(WeatherResult.self, from: data)
                DispatchQueue.main.async {
                    self?.temperature = jsonData.main.temp
                    self?.city = jsonData.name
                    self?.imageName = jsonData.weather.first?.condition.image
                    self?.updateUI()
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func updateUI() {
        if let temperature = temperature, let city = city, let imageName = imageName {
            self.tempImage.image = UIImage(systemName: imageName)
            self.tempImage.tintColor = .label
            self.temp.text = String(format: "%.1f", temperature) + "°"
            self.cityLabel.text = city
        }
    }
}

