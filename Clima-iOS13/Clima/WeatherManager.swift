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

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a245a41b65a5a7852a0703183f9e15b5&units=metric"
    
    func fetchWeathe(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }
    
}
