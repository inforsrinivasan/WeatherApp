//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import Foundation

struct WeatherViewModel:Decodable{
    let name:Dynamic<String>
    var currentTemperature:TemperatureViewModel
    
    private enum CodingKeys:String,CodingKey{
        case name
        case currentTemperature = "main"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic.init(value: try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
    
}


struct TemperatureViewModel:Decodable{
    var temperature:Dynamic<Double>
    let temperatureMinimum:Dynamic<Double>
    let temperatureMaximum:Dynamic<Double>
    
    private enum CodingKeys:String,CodingKey{
        case temperature = "temp"
        case temperatureMinimum = "temp_min"
        case temperatureMaximum = "temp_max"
    }
    
    init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = Dynamic.init(value: try container.decode(Double.self, forKey: .temperature))
        temperatureMaximum =  Dynamic.init(value: try container.decode(Double.self, forKey: .temperatureMaximum))
        temperatureMinimum =  Dynamic.init(value: try container.decode(Double.self, forKey: .temperatureMinimum))
    }
}

// Binding

class Dynamic<T>:Decodable where T:Decodable{
    
    typealias Listener = (T)->()
    
    var listener:Listener?
    
    var value:T{
        didSet{
            self.listener?(value)
        }
    }
    
    func bind(listener:@escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(value:T) {
        self.value = value
    }
    
    private enum CodingKeys:String,CodingKey{
        case value
    }
    
}
