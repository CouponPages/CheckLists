//
//  ChecklistTableTableViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 9/23/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate
{

    var items = [ChecklistItem]()
    
    @IBAction func addItem()
    {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        

    }

    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func documentsDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    //
    //
    func dataFilePath() -> URL
    {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    //
    //
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        saveCheckListItems()
        
        navigationController?.popViewController(animated: true)
    }
    
    func loadCheckListItems()
    {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path)
        {
            let decoder = PropertyListDecoder()
            do
            {
                items = try decoder.decode([ChecklistItem].self, from: data)
            }
            catch
            {
                print("Error decoding item array!")
            }
            
        }
    }
    
    
    //
    //
    func saveCheckListItems()
    {
        // 1
        let encoder = PropertyListEncoder()
        // 2
        do
        {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        }
        catch
        {
            print("Error encoding item array!")
        }
        
    }
    
    
    //
    //
    func ItemDetailViewController( _ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
    {
        if let index = items.index(of: item)
        {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath)
            {
                configureText(for: cell, with: item)
                
            }
            
        }
        saveCheckListItems()
        navigationController?.popViewController(animated:true)
        
    }
    
    //
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        if segue.identifier == "AddItem"
        {
            // 2
            let controller = segue.destination as! ItemDetailViewController
            // 3
            controller.delegate = self
        }
        else if segue.identifier == "EditItem"
        {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.itemToEdit = items[indexPath.row]
            }
            
        }
    }
    
    
    
    
    override func tableView( _ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath )
    {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        saveCheckListItems()
    }
    


    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        loadCheckListItems()
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
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        return cell
    }

    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem)
    {
        let label = cell.viewWithTag(1001) as! UILabel
        if item.checked { label.text = "✅" } else { label.text = "" }
        

        
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem)
    {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
        
    }
    


    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            let item = items[indexPath.row]
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
            configureText(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        saveCheckListItems()
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
