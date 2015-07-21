//
//  DatePickerViewController.swift
//  26 OutaSwift
//
//  Created by ian kunneke on 7/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
{
    @IBOutlet weak var picker: UIDatePicker!
    
    var delegate: TimeCircuitsDatePickerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        delegate?.destinationDateWasChosen(picker.date)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
