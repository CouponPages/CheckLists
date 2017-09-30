//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 9/24/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *)
        {
            navigationItem.largeTitleDisplayMode = .never
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
    @IBAction func cancel()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done()
    {
        print("You entered \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }

    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
}
