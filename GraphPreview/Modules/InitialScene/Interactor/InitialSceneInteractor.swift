//
//  InitialSceneInteractor.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

final class InitialSceneInteractor {
	init(withRouter router: InitialSceneRoutable, presenter: InitialScenePresentable, service: InitialSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: InitialSceneRoutable
	private let presenter: InitialScenePresentable
	private let service: InitialSceneInteractorServiceType
}

extension InitialSceneInteractor: InitialSceneInteractable {
	func makeRequest(requestType: InitialSceneInteractorRequest.RequestType) {
		switch requestType {
		case .testRequest:
            #warning("test request placeholder to replace")
		}
	}
}

extension InitialSceneInteractor: BaseInteractable {
    func lifeCycleDidChanged(event type: BaseInteractableRequest.SceneLifeCycleEventType) {
        switch type {
        case .sceneDidLoad:
            service.performViewModelCall(with: .setupSubscription)
            presenter.response(responseType: .initialSetup)
            presenter.response(responseType: .prepareForInitialAnimation)
        case .didEnterForeground:   presenter.response(responseType: .runInitialAnimation)
        case .didEnterBackground:   presenter.response(responseType: .prepareForInitialAnimation)
        }
    }
}
