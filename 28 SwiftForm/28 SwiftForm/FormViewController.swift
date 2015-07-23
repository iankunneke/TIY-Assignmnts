//
//  FormViewController.swift
//  28 SwiftForm
//
//  Created by ian kunneke on 7/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var streetAddressText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var zipText: UITextField!
    @IBOutlet weak var phoneText: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var returnValue = false
        if (textField == nameTextField)
        {
            if !nameTextField.text.isEmpty
            {
                if nameTextField.text.componentsSeparatedByString(" ").count == 2
                {
                    streetAddressText.becomeFirstResponder()
                    returnValue = true
                }
            }
        }
        else if (textField == self.streetAddressText)
        {
            if !streetAddressText.text.isEmpty
            {
                if streetAddressText.text .componentsSeparatedByString(" ").count >= 3
                {
                    cityText .becomeFirstResponder()
                    returnValue = true
                }
            }
        }
        else if (textField == cityText)
        {
            if !cityText.text.isEmpty
            {
                stateText .becomeFirstResponder()
                returnValue = true
            }
        }
        else if (textField == stateText)
        {
            if count(stateText.text) == 2
            {
                zipText .becomeFirstResponder()
                returnValue = true
            }
        }
        
        else if (textField == zipText)
        {
            //func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replaceString string: String) -> Bool
            //{
            //let text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
            if count(zipText.text) == 5
            {
            phoneText .becomeFirstResponder()
            returnValue = true
            }
            
        }
        else if (textField == phoneText)
        {
            if count(phoneText.text) == 10
            {
                phoneText .resignFirstResponder()
                returnValue = true
            }
        }
        return returnValue
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
