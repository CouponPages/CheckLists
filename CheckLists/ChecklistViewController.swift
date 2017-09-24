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
    let row0text = "Walk the dog"
    let row1text = "Brush teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = true
    var row2checked = true
    var row3checked = false
    var row4checked = false
    
    
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
        
        if indexPath.row == 0
        { label.text = row0text }
        else if indexPath.row == 1
        { label.text = row1text}
        else if indexPath.row == 2
        { label.text = row2text }
        else if indexPath.row == 3
        { label.text = row3text }
        else if indexPath.row == 4
        { label.text = row4text}

        
        configureCheckmark(for: cell, at: indexPath)
        
       
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            var isChecked = false
            
            if indexPath.row == 0
            { row0checked = !row0checked
                isChecked = row0checked }
            else if indexPath.row == 1
            { row1checked = !row1checked
                isChecked = row1checked }
            else if indexPath.row == 2
            { row2checked = !row2checked
                isChecked = row2checked }
            else if indexPath.row == 3
            { row3checked = !row3checked
                isChecked = row3checked }
            else if indexPath.row == 4
            { row4checked = !row4checked
                isChecked = row4checked }
            
            if isChecked { cell.accessoryType = .checkmark } else { cell.accessoryType = .none }
            
            
            
            
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath)
    {
        var isChecked = false
        
        if indexPath.row == 0 { isChecked = row0checked } else if indexPath.row == 1 { isChecked = row1checked } else if indexPath.row == 2 { isChecked = row2checked } else if indexPath.row == 3 { isChecked = row3checked } else if indexPath.row == 4 { isChecked = row4checked }
        
        if isChecked { cell.accessoryType = .checkmark } else { cell.accessoryType = .none }
        
        
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
