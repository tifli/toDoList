//
//  CompleteToDoViewController.swift
//  toDoList
//
//  Created by Tiffany Li on 7/19/21.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    var selectedToDo: ToDoCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //making the label in completeToDoViewController the same name
        titleLabel.text = selectedToDo?.name
    }
    
    //clicking mark as completed button and removing to do from list
    @IBAction func completedTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        if let theToDo = selectedToDo { //if that toDo exists
            context.delete(theToDo) //deleting this specific toDo
            navigationController?.popViewController(animated: true)
        }
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
