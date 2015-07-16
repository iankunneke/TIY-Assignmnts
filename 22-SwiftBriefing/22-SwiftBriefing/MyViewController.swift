//
//  MyViewController.swift
//  22-SwiftBriefing
//
//  Created by ian kunneke on 7/15/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MyViewController: UIViewController
{
    @IBOutlet weak var agentNameTextField: UITextField!
    @IBOutlet weak var agentPasswordTextField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var missionBriefingTextView: UITextView!
    
    @IBAction func authenticateAgent (sender: AnyObject)
    {
        if agentNameTextField .isFirstResponder()
        {
            agentNameTextField .resignFirstResponder()
        }
        if !agentNameTextField.text.isEmpty && !agentPasswordTextField.text.isEmpty && agentNameTextField.text.componentsSeparatedByString(" ").count == 2
        {
            let agentName = agentNameTextField.text
            let nameComponents = agentName.componentsSeparatedByString(" ")
            greetingLabel.text = "Good Evening, Agent \(nameComponents[1])"
            
            missionBriefingTextView.text = "This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent \(nameComponents[1]), you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."
            
            self.view.backgroundColor = UIColor.greenColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.redColor()
        }

    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.agentNameTextField.text = ""
        self.agentPasswordTextField.text = ""
        self.missionBriefingTextView.text = ""
        


    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    if !agentNameTextField.text.isEmpty && !agentPasswordTextField.text.isEmpty
    {
        resignFirstResponder()
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
}
