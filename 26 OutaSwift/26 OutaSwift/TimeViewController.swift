//
//  ViewController.swift
//  26 OutaSwift
//
//  Created by ian kunneke on 7/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol TimeCircuitsDatePickerDelegate
{
    func destinationDateWasChosen(destinationDate: NSDate)
}

class TimeViewController: UIViewController, TimeCircuitsDatePickerDelegate
{
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var currentSpeedLabel: UILabel!
    
    let formatter = NSDateFormatter()
    var speed = 0
    var timer: NSTimer?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Time Circuits"
        
        let formatString = NSDateFormatter.dateFormatFromTemplate("MMMddyyyy", options: 0, locale: NSLocale .currentLocale())
        
        formatter.dateFormat = formatString
        
        presentTimeLabel.text = formatter .stringFromDate(NSDate())
        
        currentSpeedLabel.text = "\(speed) MPH"
        
        lastTimeDepartedLabel.text = "--- -- ----"
        
        
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDestinationDatePickerSegue"
        {
            let datePickerVC = segue.destinationViewController as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
    func destinationDateWasChosen(destinationDate: NSDate)
    {
        destinationTimeLabel.text = formatter .stringFromDate(destinationDate)
    }
    
    @IBAction func travelBack(sender: UIButton)
    {
    startTimer()
    }
    
    func startTimer()
    {
        timer = NSTimer .scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateSpeed", userInfo: nil, repeats: true)
    }
    func stopTimer()
    {
        timer? .invalidate()
        timer = nil
    }
    
    func updateSpeed()
    {
        if speed < 88
        {
            speed++
            currentSpeedLabel.text = "\(speed) MPH!"
        }
        else
        {
            stopTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            currentSpeedLabel.text = "\(speed) MPH"
        }
    }
}
