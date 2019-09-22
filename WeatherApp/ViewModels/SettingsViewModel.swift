//
//  SettingsViewModel.swift
//  WeatherApp
//
//  Created by Srinivas on 20/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import Foundation

enum Unit:String,CaseIterable{
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit{
    var displayName:String{
        switch self {
        case .celcius:
            return "celcius"
        case .fahrenheit:
        return "fahrenheit"
        }
    }
}

struct SettingsViewModel{
    let units = Unit.allCases
    
    func getItemForIndex(index:Int)->Unit{
        return units[index]
    }
    
    private var _selectedUnit:Unit = Unit.fahrenheit
    
    var selectedUnit:Unit{
        get{
            let defaults = UserDefaults.standard
            if let val = defaults.value(forKey: "unit") as? String{
                return Unit.init(rawValue: val)!
            }
            return self._selectedUnit
        }
        set{
            let defaults = UserDefaults.standard
            defaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
