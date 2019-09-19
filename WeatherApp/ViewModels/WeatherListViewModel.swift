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
    
}
