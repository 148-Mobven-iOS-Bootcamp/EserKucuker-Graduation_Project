//
//  TaskDetailPresentation.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

struct TaskDetailPresentation {
    var title: String
    let detail : String
    let deadlineDate : Date
    
    init(title : String, detail : String, deadlineDate : Date) {
        self.title = title
        self.detail = detail
        self.deadlineDate = deadlineDate
        
    }
    init(todo : Tasks){
        // TODO: add guard let
        self.init(title: todo.title! , detail: todo.detail!, deadlineDate: todo.deadlineDate!)
    }
}
