//
//  TaskDetailInteractor.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

class TaskDetailInteractor: TaskDetailInteractorProtocol, TaskDetailDataStoreProtocol {
    
    
    var task: Tasks?
    var presenter: TaskDetailPresenterProtocol?
    var dataManager : DataManagerProtocol
    
    init(dataManager: DataManagerProtocol){
        self.dataManager = dataManager
    }

    func viewdidload() {
        guard let tasks = task else { return }
        self.presenter?.handleOutput(.showTask(tasks))
    }
    
    func addTask(task:TaskDetailPresentation) {
        dataManager.saveData(task: task)
    }
    
    func update(tasks: TaskDetailPresentation){
        guard let todo = task else { return }
        dataManager.updateData(todoItem: todo, title: tasks.title, subtitle: tasks.detail, date: tasks.deadlineDate)
    }
}
