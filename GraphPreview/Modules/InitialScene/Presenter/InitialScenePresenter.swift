//
//  InitialScenePresenter.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

final class InitialScenePresenter {
	init(for view: InitialSceneViewControllerType, service: InitialScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: InitialSceneViewControllerType?
	private let service: InitialScenePresenterServiceType
}

extension InitialScenePresenter: InitialScenePresentable {
	func response(responseType: InitialScenePresenterResponse.InitialSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup:                 viewController?.update(viewModelDataType: .initialSetup(with: model))
        case .prepareForInitialAnimation:   viewController?.update(viewModelDataType: .prepareForInitialAnimation)
        case .runInitialAnimation:          viewController?.update(viewModelDataType: .runInitialAnimation)
		case .drainView:                    viewController = nil
		}
	}
}
