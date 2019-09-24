//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class WeatherCell:UITableViewCell{
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    func configure(vm:WeatherViewModel){
        self.cityNameLabel.text = vm.name.value
        self.temperatureLabel.text = vm.currentTemperature.temperature.value.formatAsDegree
    }
    
}
