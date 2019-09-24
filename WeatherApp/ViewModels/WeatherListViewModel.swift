//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import Foundation

struct WeatherListViewModel{
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(vm:WeatherViewModel){
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(section:Int)->Int{
        return weatherViewModels.count
    }
    
    func modelAtIndex(index:Int)->WeatherViewModel{
        return self.weatherViewModels[index]
    }
    
    mutating func updateUnit(to Unit:Unit){
        switch Unit {
        case .celcius:
            toCelcius()
        case .fahrenheit:
            toFarenheit()
        }
    }
    
    mutating func toCelcius(){
        self.weatherViewModels = self.weatherViewModels.map{ vm in
            var v = vm
            v.currentTemperature.temperature.value = (v.currentTemperature.temperature.value - 32.0) * (5.0 / 9.0)
            return v
        }
    }
    
    mutating func toFarenheit(){
        self.weatherViewModels = self.weatherViewModels.map{ vm in
            var v = vm
            v.currentTemperature.temperature.value = (v.currentTemperature.temperature.value * (9.0 / 5.0)) + 32
            return v
        }
    }
    
}
