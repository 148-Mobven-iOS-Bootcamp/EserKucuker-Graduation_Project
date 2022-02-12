//
//  TaskDTO.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 7.02.2022.
//

import Foundation


struct TaskDTO {
    let title : String
    let detail : String
    let deadlineDate: Date?
    
    init(title : String, detail : String, deadlineDate : Date?){
        self.title = title
        self.detail = detail
        self.deadlineDate = deadlineDate
    }
    
    // TODO: Add Guard let
    init(todo : Tasks){
        self.init(title: todo.title!, detail: todo.detail!, deadlineDate: todo.deadlineDate)
    }
}


struct Task {
    let title : String
    let detail : String
    let deadlineDate: Date?
}
