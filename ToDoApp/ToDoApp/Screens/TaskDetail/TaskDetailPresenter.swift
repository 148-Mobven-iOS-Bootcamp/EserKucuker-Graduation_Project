//
//  TaskDetailPresenter.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

class TaskDetailPresenter: TaskDetailPresenterProtocol {
    //TODO: Look weak
    var screenType : builderChoice!
    weak var viewController: TaskDetailViewProtocol?
    
    func handleOutput(_ output: TaskDetailInteractorOutput) {
        switch output {
        case .showTask(let taskDTO):
            viewController?.handleOutput(.showTodoDetail(TaskDetailPresentation(todo: taskDTO)))
        case .addTask:
            viewController?.handleOutput(.addTodo)
        }
    }
}
