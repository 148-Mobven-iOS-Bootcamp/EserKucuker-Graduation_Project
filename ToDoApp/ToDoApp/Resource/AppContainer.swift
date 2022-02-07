//
//  AppContainer.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 7.02.2022.
//

import Foundation

var appContainer = AppContainer()

class AppContainer {
    var router = AppRouter()
    var dataManager = CoreDataManager()
    var ischange = false
}

