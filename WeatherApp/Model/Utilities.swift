//
//  Utilities.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 18/07/2023.
//

import UIKit


struct Utilities {
    
    static let shared = Utilities()
    
    func formatConditionCode(with conditionCode: Int) -> String {
            switch conditionCode {
            case 1000:
                return "sun.max"
            case 1003:
                return "cloud.sun"
            case 1006...1009:
                return "cloud"
            case 1030:
                return "sun.haze"
            case 1063,1150,1153,1180,1183, 1087:
                return "cloud.drizzle"
            case 1066,1189,1210,1213,1216,1219,1222,1225,1240,1168,1072,1198:
                return "cloud.snow"
            case 1069, 1204,1207, 1249:
                return "cloud.sleet"
            case 1114, 1117:
                return "wind.snow"
            case 1135, 1147:
                return "cloud.fog"
            case 1171, 1201, 1195, 1192, 1246 :
                return "cloud.heavyrain"
            case 1186,1243,1252:
                return "cloud.rain"
            case 1237, 1261, 1264:
                return "snowflake"
            case 1255, 1258, 1279, 1282:
                return "cloud.snow"
            case 1273, 1276:
                return "cloud.bolt.rain"
            default:
                return "cloud"
                
            }
    }
    
    let sunny : [CGColor] = [
        UIColor.systemYellow.cgColor,
        UIColor.systemOrange.cgColor,
        UIColor.systemCyan.cgColor,
        UIColor.systemBlue.cgColor,
    ]
    let rainy : [CGColor] = [
        UIColor.systemGray6.cgColor,
        UIColor.systemGray5.cgColor,
        UIColor.systemBlue.cgColor,
        UIColor.systemCyan.cgColor,
    ]
    
    let cloudy : [CGColor] = [
        UIColor.systemGray6.cgColor,
        UIColor.systemGray5.cgColor,
        UIColor.systemGray4.cgColor,
        UIColor.systemGray3.cgColor,
    ]
    
    let snowy : [CGColor] = [
        UIColor.systemGray.cgColor,
        UIColor.systemGray2.cgColor,
        UIColor.white.cgColor,
        UIColor.white.cgColor,
    ]
    
    func getColorArrayFromCondition(with conditionCode: Int) -> [CGColor]{switch conditionCode {
    case 1000...1030:
        return sunny
    case 1063,1150,1153,1180,1183, 1087, 1171, 1201, 1195, 1192, 1246:
        return rainy
    case 1066,1189,1210,1213,1216,1219,1222,1225,1240,1168,1072,1198,1186,1243,1252,1273, 1276:
        return snowy
    case 1069, 1204,1207, 1249, 1114, 1117,1237, 1261, 1264,1255, 1258, 1279, 1282:
        return snowy
    case 1135, 1147:
        return cloudy
    default:
        return cloudy
        
    }
    }
}
