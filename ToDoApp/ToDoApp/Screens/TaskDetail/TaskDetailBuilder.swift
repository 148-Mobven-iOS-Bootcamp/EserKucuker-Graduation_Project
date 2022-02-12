//
//  TaskDetailBuilder.swift
//  ToDoApp
//
//  Created by Eser Kucuker on 6.02.2022.
//

import Foundation
import UIKit

class TaskDetailBuilder {
    static func build(screentype: builderChoice) -> TaskDetailTableViewController{
        let storyboard = UIStoryboard(name: TaskDetailBuilderString.name.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: TaskDetailBuilderString.name.rawValue) as! TaskDetailTableViewController
        viewController.screenType = screentype
        let interactor = TaskDetailInteractor(dataManager: appContainer.dataManager, notificationManager: appContainer.notificationManager )
        let presenter = TaskDetailPresenter()
        let router = TaskDetailRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
