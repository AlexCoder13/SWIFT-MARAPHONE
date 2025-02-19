//
//  WeatherManager.swift
//  Clima
//
//  Created by Александр Семёнов on 17.02.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//


// ключ API: a245a41b65a5a7852a0703183f9e15b5
// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}&units=metric

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a245a41b65a5a7852a0703183f9e15b5&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeathe(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        let weatherVC = WeatherViewController()
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoderData.weather[0].id
            let name = decoderData.name
            let temp = decoderData.main.temp
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            
            print(weather.conditionName)
            print(weather.temperatureString)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func getConditionName(weatherID: Int) -> String {
        switch weatherID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }

    }
    
}
