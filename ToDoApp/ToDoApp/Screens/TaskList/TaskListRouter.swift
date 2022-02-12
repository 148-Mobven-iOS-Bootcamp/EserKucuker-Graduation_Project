//
//  TaskListRouter.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

class TaskListRouter: TaskListRouterProtocol {
    weak var viewController: TaskListViewController?
    var dataStore: TaskListDataStoreProtocol?
    
    func navigate(to route: TaskListRoute) {
        switch route {
        case .showTodoDetail(let index):
            if let tasks = dataStore?.tasks {
                let task = tasks[index]
                
                let destinationVC = TaskDetailBuilder.build(screentype: .DetailView)
                var destinationDataStore = destinationVC.router?.dataStore
                
                destinationDataStore?.task = task
                self.viewController?.navigationController?.show(destinationVC, sender: true)
                
            }
        case .showAddView:
            let destinationVC = TaskDetailBuilder.build(screentype: .AddView)
            self.viewController?.navigationController?.show(destinationVC, sender: true)
        }
    }
}

