//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 15/07/2023.
//

import Foundation

struct WeatherManager {
    
    // MARK: - Networking
    func fetchForecast() async throws -> [WeatherModel] {
        
            let apiKey = "04fd2d9b66e1456786d85131231507"
            let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=London&days=7&aqi=no&alerts=no")
            let request = URLRequest(url: url!)
            let (data, _) = try await URLSession.shared.data(for: request)
            let fetchedData = try JSONDecoder().decode(Weather.self, from: data)
     
            return formatWeatherData(with: fetchedData)     
    }
    
    // MARK: - Utilities
    private func formatWeatherData(with weatherJson : Weather) -> [WeatherModel] {
        var weatherArray = [WeatherModel]()
        let data = weatherJson.forecast.forecastday
        
        for day in data {
            let dayWeather = WeatherModel(date: day.date, hours: day.hour,
                                      maxtemp_c: day.day.maxtemp_c, mintemp_c: day.day.mintemp_c, maxtemp_f: day.day.maxtemp_f, mintemp_f: day.day.mintemp_f, conditionString: day.day.condition.text, conditionCode: day.day.condition.code)
            
            weatherArray.append(dayWeather)
        }
        return weatherArray
       
    }
    
    
}
