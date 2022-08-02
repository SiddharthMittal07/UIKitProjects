//
//  Weather.swift
//  Weather
//
//  Created by Siddharth Mittal on 02/08/22.
//

import Foundation

struct WeatherResult: Codable {
    var coord: Coordinates
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var sys: Sys
    var name: String
}

struct Coordinates: Codable {
    var lat: Double
    var lon: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    
    var condition: WeatherConditions {
        switch id {
        case 200...299: return .thunderstorm
        case 300...399: return .rain
        case 500...599: return .showerRain
        case 600...699: return .snow
        case 700...799: return .mist
        case 800: return .clearSky
        case 801...804: return .fewClouds
        default: return .clearSky
        }
    }
}

struct Main: Codable {
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Double
    var humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case feelsLike = "feels_like"
    }
}

struct Wind: Codable {
    var speed: Double
    var deg: Int
}

struct Sys: Codable {
    var type: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

enum WeatherConditions {
    case clearSky
    case fewClouds
    case showerRain
    case rain
    case thunderstorm
    case snow
    case mist
    
    var image: String {
        switch self {
        case .clearSky: return "sun.max.fill"
        case .fewClouds: return "cloud"
        case .showerRain: return "cloud.heavyrain"
        case .rain: return "cloud.rain"
        case .thunderstorm: return "cloud.bolt.rain"
        case .snow: return "cloud.snow"
        case .mist: return "snowflake"
        }
    }
}
