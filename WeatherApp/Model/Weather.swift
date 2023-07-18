//
//  Weather.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 15/07/2023.
//

import Foundation

struct Weather : Codable {
    let location : Location
    let current: Current
    let forecast : Forecast
}
struct Location: Codable {
    let name: String
    let country: String
}
struct Current: Codable {
    let temp_c: Double
    let temp_f: Double
    let condition: Condition
}
struct Condition : Codable {
    let text: String
    let code: Int
}
struct Forecast: Codable {
    let forecastday : [ForecastDay]
}
struct ForecastDay: Codable {
    let date : String
    let day: Day
    let hour: [Hour]
}
struct Day : Codable {
    let maxtemp_c: Double
    let maxtemp_f: Double
    let mintemp_c: Double
    let mintemp_f: Double
    let condition: Condition
}

struct Hour: Codable {
    let time: String
    let temp_c: Double
    let temp_f: Double
    let condition: Condition
}
