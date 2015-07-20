//
//  BrowserViewController.swift
//  25-Easy Browser
//
//  Created by ian kunneke on 7/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController, UITextFieldDelegate
    
    
    
{

    @IBOutlet weak var webView: UIWebView!
    
    //@IBAction func openPage(sender: AnyObject)
    //{
        //NSURL (scheme: "http", host: "www.developer.apple.com" , path: "")
           // var url : NSURL
            //url = NSURL(string: "https://developer.apple.com")!
        //webView.loadRequest(NSURLRequest(URL: url))

    //}
 

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
        textField.resignFirstResponder()
        if let url = NSURL(string: textField.text)
        {
            webView.loadRequest(NSURLRequest(URL: url))
        }
        return true
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
