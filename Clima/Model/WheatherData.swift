//
//  WheatherData.swift
//  Clima
//
//  Created by Igor Postnikov on 5/13/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WheaterData: Codable {
    let coord: Coord
    let weather: [Wheather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
    
}

struct Wheather:Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String

}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

struct Clouds: Codable {
    let all: Int
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
