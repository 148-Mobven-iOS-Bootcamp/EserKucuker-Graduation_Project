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
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text,
              let detail = detailTextView.text else {
                  print(" Veriler Artık Options Değil ");return }
        if (title == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Lütfen Başlık Giriniz", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("Cancel")
            case.destructive:
                print("destructive")
            default:
                break
            }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else { let task = TaskDetailPresentation(title: title, detail: detail, deadlineDate: date)
            switch screenType {
                
            case .DetailView:
                interactor?.update(tasks: task)
                appContainer.ischange = true
                router?.navigate(to: .saveAndBack)
                
            case .AddView:
                interactor?.addTask(task: task)
                appContainer.ischange = true
                router?.navigate(to: .saveAndBack)
                
            case .none:
                break
            }
            
        }
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        deadLineDateLabel.text = convertToString(date: sender.date)
    }
    
    @IBAction func reminderSwitchChanged(_ sender: UISwitch) {
        deadLineDateLabel.textColor = (reminderSwitch.isOn ? .black : .lightGray )
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
    // MARK: - Table view data source
extension TaskDetailTableViewController {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case IndexPath(row: 1 , section: 2 ):
            return reminderSwitch.isOn ? 150 : 0
        case IndexPath(row: 0 , section: 1 ):
            return 107
        default:
            return 44
        }
    }

}
