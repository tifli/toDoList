//
//  AddToDoViewController.swift
//  toDoList
//
//  Created by Tiffany Li on 7/19/21.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //button
    @IBAction func addTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //making new core data object
        let context = appDelegate.persistentContainer.viewContext
        
        let toDo = ToDoCD(context: context)
        
        toDo.name = titleTextField.text
        toDo.important = importantSwitch.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
        
        /*
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText //whatever they typed in
            toDo.important = importantSwitch.isOn //yes / no
        }
        
        //update doDos array w/ new object
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true) //after click add to do button, brings user back to original list screen */
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
