//
//  ViewController.swift
//  Miracle Pill
//
//  Created by Michael Jay Abalos on 23/09/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var successView: UIView!
    
    let states = ["Cebu", "Bohol", "Iloilo", "CDO", "Zamboanga"]
    let cities = ["Cebu City", "Tagbilaran City", "Iloilo City", "CDO City", "Zamboanga City"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
        cityPicker.dataSource = self
        cityPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyButton(_ sender: Any) {
        print("BUY")
        successView.isHidden = false
    }
    
    @IBAction func stateButton(_ sender: Any) {
        statePicker.isHidden = false
        cityPicker.isHidden = true
        buyButton.isHidden = true
    }
    
    @IBAction func cityButton(_ sender: Any) {
        cityPicker.isHidden = false
        statePicker.isHidden = true
        buyButton.isHidden = true
    }
    
    //implement require protocol delegate
    
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var limit = 0
        
        if pickerView.tag == 1{
            limit = states.count
        }else{
            limit = cities.count
        }
        return limit
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var title = ""
    
        if pickerView.tag == 1{
            title = states[row]
        }else{
            title = cities[row]
        }
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView.tag == 1{
            stateButton.setTitle(states[row], for: .normal)
            statePicker.isHidden = true
            cityPicker.isHidden = true
        }else{
            cityButton.setTitle(cities[row], for: .normal)
            cityPicker.isHidden = true
            statePicker.isHidden = true
        }
        
         buyButton.isHidden = false
    }
}

