//
//  TaskDetailTableViewController.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import UIKit

class TaskDetailTableViewController: UITableViewController, TaskDetailViewProtocol {

    @IBOutlet weak var addTaskTappedButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var deadLineDateLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // TODO: For Texting
    var date = Date.now
    func convertToString(date: Date) -> String {
        let date = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    
    var interactor: TaskDetailInteractorProtocol?
    var router: TaskDetailRouterProtocol?
    var screenType: builderChoice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewdidload()
        reminderSwitch.isOn = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        switch output {
        case .showTodoDetail(let taskDetailPresentation):
            addTaskTappedButton.setTitle("Update", for: .normal)
            titleTextField.text = taskDetailPresentation.title
            detailTextView.text = taskDetailPresentation.detail
            deadLineDateLabel.text = convertToString(date: taskDetailPresentation.deadlineDate)
        }
    }

    // MARK: - Table view data source





}
