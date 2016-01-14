//
//  ViewController.swift
//  LoveFinder
//
//  Created by xuqidong on 15/8/28.
//  Copyright (c) 2015年 xuqidong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var name: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var birthday: UIDatePicker!
    @IBOutlet var heightNumber: UISlider!
    @IBOutlet var height: UILabel!
    @IBOutlet var hasProperty: UISwitch!
    @IBOutlet var result: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 身高
    @IBAction func heightChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        var i:Int = Int(slider.value)
        slider.value = Float(i)
    
        height.text = "\(i)厘米"
    }
    
    // OK
    @IBAction func OK(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅" : "白富美"
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian!.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))
        let age = components.year
        
        let hasPropertyText = hasProperty.on ? "有房" : "没房"
        
        result.text = "\(name.text),\(age)岁,\(genderText),身高\(height.text!),\(hasPropertyText),求交往！"
        
        
    }
    
    // UITextFiledDelegate
    // 取消键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

