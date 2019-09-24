//
//  BindingTextField.swift
//  WeatherApp
//
//  Created by Srinivas on 23/09/19.
//  Copyright © 2019 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class BindingTextField:UITextField{
    
    var textChangeClosure:(String)->() = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func bind(callback:@escaping (String)->()){
        self.textChangeClosure = callback
    }
    
    func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField:UITextField){
        if let text = textField.text{
        self.textChangeClosure(text)
        }
    }
    
}
