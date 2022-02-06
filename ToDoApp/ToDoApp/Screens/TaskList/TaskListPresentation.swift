//
//  TaskListPresentation.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation

struct TaskListPresentation {
    
    let title : String
    
    
    init(title : String){
        self.title = title
        
    }
    
    init(todo : Tasks){
        self.init(title: todo.title!)
    }
}

