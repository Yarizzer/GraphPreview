//
//  InitialScenePresenterContract.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol InitialScenePresentable: AnyObject {
    func response(responseType: InitialScenePresenterResponse.InitialSceneResponseType)
}

struct InitialScenePresenterResponse {
	enum InitialSceneResponseType {
		case initialSetup
        case runInitialAnimation
        case prepareForInitialAnimation
		case drainView
	}
}
