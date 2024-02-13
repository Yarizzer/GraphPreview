//
//  BaseInteractable.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

protocol BaseInteractable {
    func lifeCycleDidChanged(event type: BaseInteractableRequest.SceneLifeCycleEventType)
}

struct BaseInteractableRequest {
    enum SceneLifeCycleEventType {
        case sceneDidLoad
        case didEnterForeground
        case didEnterBackground
    }
}
