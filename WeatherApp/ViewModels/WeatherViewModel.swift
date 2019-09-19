//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import Foundation

struct WeatherViewModel:Decodable{
    let name:String
    let currentTemperature:TemperatureViewModel
    
    private enum CodingKeys:String,CodingKey{
        case name
        case currentTemperature = "main"
    }
}


struct TemperatureViewModel:Decodable{
    let temperature:Double
    let temperatureMinimum:Double
    let temperatureMaximum:Double
    
    private enum CodingKeys:String,CodingKey{
        case temperature = "temp"
        case temperatureMinimum = "temp_min"
        case temperatureMaximum = "temp_max"
    }
}
