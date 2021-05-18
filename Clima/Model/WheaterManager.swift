//
//  WheaterManager.swift
//  Clima
//
//  Created by Igor Postnikov on 5/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2a04ab0ecf20edcf54ecfda26486ed1c&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WheaterData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
            print(weather.temperatureString)
            
//            print(decodedData.coord.lat)
//            print(decodedData.coord.lon)
//            print(decodedData.weather[0].id)
//            print(decodedData.weather[0].main)
//            print(decodedData.weather[0].description)
//            print(decodedData.weather[0].icon)
//            print(decodedData.base)
//            print(decodedData.main.temp)
//            print(decodedData.main.feels_like)
//            print(decodedData.main.temp_min)
//            print(decodedData.main.temp_max)
//            print(decodedData.main.pressure)
//            print(decodedData.main.humidity)
//            print(decodedData.visibility)
//            print(decodedData.wind.speed)
//            print(decodedData.wind.deg)
//            print(decodedData.clouds.all)
//            print(decodedData.dt)
//            print(decodedData.sys.type)
//            print(decodedData.sys.id)
//            print(decodedData.sys.country)
//            print(decodedData.sys.sunrise)
//            print(decodedData.sys.sunset)
//            print(decodedData.timezone)
//            print(decodedData.id)
//            print(decodedData.name)
//            print(decodedData.cod)
        } catch {
            print(error)
            return nil
        }
    }
    
    
    
}
