//
//  Models.swift
//  MVVM-WeatherApp
//
//  Created by ahmadmedo on 7/24/21.
//

import Foundation
// Data

class WeatherModel: Codable{
    let location: LocationInfo
    let current: CurrentWeather
}

class LocationInfo: Codable {
    let name: String
    let country: String
}

class CurrentWeather: Codable {
    let temp_c: Float
    let condition: ConditionInfo
}

class ConditionInfo: Codable {
    let text: String
}
