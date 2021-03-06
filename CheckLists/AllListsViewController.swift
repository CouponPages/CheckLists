//
//  AllListsViewController.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 10/4/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {
    var lists = [Checklist]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }

        var list = Checklist(name: "Birthdays")
        lists.append(list)
        list = Checklist(name: "Groceries")
        lists.append(list)
        list = Checklist(name: "Cool Apps")
        lists.append(list)
        list = Checklist(name: "To Do")
        lists.append(list)
        lists.append(Checklist(name: "One more thing"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    //
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }

    //
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        // Update cell informaiton
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        return cell
        

        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
    {
        let controller = storyboard!.instantiateViewController( withIdentifier: "ListDetailViewController") as! ListDetailViewController

        controller.delegate = self
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        navigationController?.pushViewController(controller, animated: true)
    }
    
   
    
    

    //
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist"
        {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as! Checklist
        }
        else if segue.identifier == "AddChecklist"
        {
            let controller = segue.destination as! ListDetailViewController
            controller.delegate = self
        }
    }
    
    
    // FIXME: - Test
    func makeCell(for tableView: UITableView) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        {
            return cell
        }
        else
        {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }

    //
    //
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    // MARK:- List Detail View Controller Delegates
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
       navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    {
        let newRowIndex = lists.count
        lists.append(checklist)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
 
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
    {
        if let index = lists.index(of: checklist)
        {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath)
            {
                cell.textLabel!.text = checklist.name
                
            }
        }
        navigationController?.popViewController(animated: true)
        
    }
    override func tableView( _ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        lists.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
 }
