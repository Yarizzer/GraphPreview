//
//  InitialScenePresenterService.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol InitialScenePresenterServiceType: AnyObject {
	var model: InitialSceneViewModelType { get }
}

final class InitialScenePresenterService {
	init(withModel model: InitialSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: InitialSceneViewModelType
}

extension InitialScenePresenterService: InitialScenePresenterServiceType {
	var model: InitialSceneViewModelType { return viewModel }
}
