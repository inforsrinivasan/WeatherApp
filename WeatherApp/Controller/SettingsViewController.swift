//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Srinivas on 20/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

protocol SettingsDelegate{
    func settingsChanged(vm:SettingsViewModel)
}

class SettingsViewController:UITableViewController{
    
    private var settingsVM = SettingsViewModel()
    var settingsDelegate:SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func close(){
        self.settingsDelegate?.settingsChanged(vm: self.settingsVM)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        let item = self.settingsVM.getItemForIndex(index: indexPath.row)
        cell.textLabel?.text = item.displayName
        if item.displayName == self.settingsVM.selectedUnit.displayName{
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach{ cell in
            cell.accessoryType = .none
        }
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.settingsVM.selectedUnit = self.settingsVM.getItemForIndex(index: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
