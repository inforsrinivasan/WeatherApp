//
//  WeatherListTableViewController.swift
//  WeatherApp
//
//  Created by Srinivas on 19/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class WeatherListTableViewController:UITableViewController{
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            if id == "addWeatherCityViewController"{
                self.prepareSegueForAddCityViewController(segue: segue)
            }
            else if id == "settingsViewController"{
                self.prepareSegueForSettingsViewController(segue: segue)
            }
        }
    }
    
    private func prepareSegueForAddCityViewController(segue:UIStoryboardSegue){
        if let nav = segue.destination as? UINavigationController{
            if let vc = nav.viewControllers.first as? AddWeatherCityViewController{
                vc.delegate = self
            }
        }
    }
    
    private func prepareSegueForSettingsViewController(segue:UIStoryboardSegue){
        
        if let nav = segue.destination as? UINavigationController{
            if let settingsVC = nav.viewControllers.first as? SettingsViewController{
                settingsVC.settingsDelegate = self
            }
        }
        
    }
    
}

extension WeatherListTableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        let vm = self.weatherListViewModel.modelAtIndex(index: indexPath.row)
        cell.configure(vm: vm)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WeatherListTableViewController:AddWeatherDelegate{
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
    
}

extension WeatherListTableViewController:SettingsDelegate{
    func settingsChanged(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
