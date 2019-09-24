//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController:UIViewController{
    
    var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var addCityTextField:BindingTextField!{
        didSet{
            addCityTextField.bind { (text) in
                self.addCityViewModel.city = text
            }
        }
    }
    
    @IBOutlet weak var state:BindingTextField!{
        didSet{
            state.bind { (text) in
                self.addCityViewModel.state = text
            }
        }
    }
    @IBOutlet weak var zip:BindingTextField!{
        didSet{
            zip.bind { (text) in
                self.addCityViewModel.zipcode = text
            }
        }
    }
    
    var delegate:AddWeatherDelegate?
    
    @IBAction func saveCity(){
        
        print("model = \(self.addCityViewModel)")
        
        if let city = addCityTextField.text{
            
            let weatherURL = URL.init(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=fab018e2d8d06fafa57694c34ceda403")!
            
            let resource = Resource<WeatherViewModel>(url: weatherURL) { (data) -> WeatherViewModel? in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            WebService().load(resource: resource) {[weak self] (result) in
                if let vm = result{
                    if let del = self?.delegate{
                        del.addWeatherDidSave(vm: vm)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
                
            }
            
           
        }
        
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
