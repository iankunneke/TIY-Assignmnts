//
//  AddCoreViewController.swift
//  CoreList
//
//  Created by ian kunneke on 7/29/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class AddCoreViewController: UIViewController, UITextFieldDelegate
{
    var delegate: AddCoreDelegate?
    
    @IBOutlet weak var coreTextField: UITextField!
    @IBAction func saveCore(sender: UIButton)
    {
        takeTheCore()
    }
    @IBAction func cancelCore(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        takeTheCore()
        return true
    }
    
    func takeTheCore()
    {
        if coreTextField.text != ""
        {
            self.delegate?.coreWasMade(coreTextField.text)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
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
