//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Srinivas on 23/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class WeatherDetailsViewController:UIViewController{
    
    var vm:WeatherViewModel?
    
    @IBOutlet weak var city:UILabel!
    @IBOutlet weak var temp:UILabel!
    @IBOutlet weak var temp_min:UILabel!
    @IBOutlet weak var temp_max:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPVMBindings()
    }
    
    func setUPVMBindings(){
        if let vmodel = self.vm{
            vmodel.name.bind { str in
                self.city.text = str
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.city.text = "Srini Changed"
        }
    }
    
}
