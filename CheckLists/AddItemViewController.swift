//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 9/24/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *)
        {
            navigationItem.largeTitleDisplayMode = .never
        }
        
    }

    
    @IBAction func cancel()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done()
    {
        navigationController?.popViewController(animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
