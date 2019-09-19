//
//  Double+Extensions.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import Foundation

extension Double{
    var formatAsDegree:String{
        return String(format: "%.0f°", self)
    }
}
