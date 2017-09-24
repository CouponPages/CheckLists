//
//  ChecklistTableTableViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 9/23/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController
{
    var row0item: ChecklistItem
    var row1item: ChecklistItem
    var row2item: ChecklistItem
    var row3item: ChecklistItem
    var row4item: ChecklistItem
    

    required init?(coder aDecoder: NSCoder)
    {
        row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        
        row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        
        row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        
        row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        
        row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        
        super.init(coder: aDecoder)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // Add the following code
        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row == 0 { label.text = row0item.text }
        else if indexPath.row == 1 { label.text = row1item.text }
        else if indexPath.row == 2 { label.text = row2item.text }
        else if indexPath.row == 3 { label.text = row3item.text }
        else if indexPath.row == 4 { label.text = row4item.text }
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }

    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath)
    {
        var isChecked = false
        
        if indexPath.row == 0 { isChecked = row0item.checked }
        else if indexPath.row == 1 { isChecked = row1item.checked }
        else if indexPath.row == 2 { isChecked = row2item.checked }
        else if indexPath.row == 3 { isChecked = row3item.checked }
        else if indexPath.row == 4 { isChecked = row4item.checked }
        
        if isChecked { cell.accessoryType = .checkmark } else { cell.accessoryType = .none }
        
        
    }

    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            if indexPath.row == 0 { row0item.checked = !row0item.checked }
            else if indexPath.row == 1 { row1item.checked = !row1item.checked }
            else if indexPath.row == 2 { row2item.checked = !row2item.checked }
            else if indexPath.row == 3 { row3item.checked = !row3item.checked }
            else if indexPath.row == 4 { row4item.checked = !row4item.checked }
            
            configureCheckmark(for: cell, at: indexPath)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    

    
    
    
    
    
    
    
    
    
    


    /*
     
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }

    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
