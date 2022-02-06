//
//  TaskDetailRouter.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

class TaskDetailRouter: TaskDetailRouterProtocol {
    weak var viewController: TaskDetailTableViewController?
    var dataStore: TaskDetailDataStoreProtocol?
    
    func navigate(to route: TaskDetailRoute) {
        switch route {
        case .showToDoList, .saveAndBack:
            viewController?.navigationController?.popViewController(animated: true)
        }
    }
}

