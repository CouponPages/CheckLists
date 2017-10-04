//
//  ItemDetailViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 9/24/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func ItemDetailViewControllerDidCancel( _ controller: ItemDetailViewController)
    func ItemDetailViewController( _ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func ItemDetailViewController( _ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}



class ItemDetailViewController: UITableViewController, UITextFieldDelegate
{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    //
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *)
        {
            navigationItem.largeTitleDisplayMode = .never
        }
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
        
    }

    
    //
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
    //
    //
    @IBAction func cancel()
    {
        delegate?.ItemDetailViewControllerDidCancel(self)
        
    }
    
    //
    //
    @IBAction func done()
    {
        if let itemToEdit = itemToEdit
        {
            itemToEdit.text = textField.text!
            delegate?.ItemDetailViewController(self, didFinishEditing: itemToEdit)
        }
        else
        {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.ItemDetailViewController(self, didFinishAdding: item)
        }
        
    }

    
    //
    //
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //
    //
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String ) -> Bool
    {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty
        {
            doneBarButton.isEnabled = false
        }
        else
        {
            doneBarButton.isEnabled = true
        }
        return true
    }
}
