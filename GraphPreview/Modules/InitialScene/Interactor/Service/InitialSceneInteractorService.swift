//
//  InitialSceneInteractorService.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractorServiceType: AnyObject {
    func performViewModelCall(with action: InitialSceneViewModelActionType)
}

final class InitialSceneInteractorService {
	init(withModel model: InitialSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: InitialSceneViewModelType
}

extension InitialSceneInteractorService: InitialSceneInteractorServiceType { 
    func performViewModelCall(with action: InitialSceneViewModelActionType) { viewModel.invoke(action: action) }
}
