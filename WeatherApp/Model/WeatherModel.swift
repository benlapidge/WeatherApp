//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 15/07/2023.
//

import Foundation

struct HourModel {
    let time: String
    var formattedTime: Date {
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        if let formattedHour = hourFormatter.date(from: time) {
            return formattedHour
        }
        return Date.now
    }
    let tempc: Double
    let tempf: Double
    let conditionString: String
    let conditionCode: Int
    var conditionIcon: String {
        Utilities.shared.formatConditionCode(with: conditionCode)
    }
}

struct WeatherModel {
    let date: String
    var formattedDate : Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        if let formattedDate = dateFormatter.date(from: date) {
            return formattedDate
        }
        return Date.now
    }
    let hours: [Hour]
    var formattedHours: [HourModel] {
        var hourArray = [HourModel]()
        for hour in hours {
            let hour = HourModel(time: hour.time,tempc: hour.temp_c,tempf: hour.temp_f, conditionString: hour.condition.text, conditionCode: hour.condition.code)
            hourArray.append(hour)
        }
        return hourArray
    }
    let maxtemp_c: Double
    var maxtemp_cRounded: String {
        String(format: "%.0f", maxtemp_c)
    }
    let mintemp_c: Double
    var mintemp_cRounded: String {
        String(format: "%.0f", mintemp_c)
    }
    let maxtemp_f: Double
    let mintemp_f: Double
                 
    let conditionString: String
    let conditionCode: Int
    var conditionIcon: String {
        Utilities.shared.formatConditionCode(with: conditionCode)
    }
}
