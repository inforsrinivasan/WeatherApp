//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Srinivas on 20/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SettingsViewController:UITableViewController{
    
    private var settingsVM = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func close(){
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
