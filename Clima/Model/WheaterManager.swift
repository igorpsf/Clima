//
//  WheaterManager.swift
//  Clima
//
//  Created by Igor Postnikov on 5/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2a04ab0ecf20edcf54ecfda26486ed1c&units=metric"
    
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
                    parseJSON(weatherData: safeData)
                }
            }
            
            //4. Start the task
            task.resume()
        
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WheaterData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
        } catch {
            print(error)
        }
    }
    
}
