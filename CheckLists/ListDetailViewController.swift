//
//  ListDetailViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 10/5/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import Foundation
import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel( _ controller: ListDetailViewController)
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?
    
    //
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable large titles
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        if let checklist = checklistToEdit
        {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
        
    }
    
    
    //
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
 
    // MARK:- Actions
    @IBAction func cancel()
    {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    //
    //
    @IBAction func done()
    {
        if let checklist = checklistToEdit
        {
            checklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
        }
        else
        {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
        }
    }
    
    
}
