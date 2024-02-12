//
//  InitialSceneInteractorContract.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractable: AnyObject {
	func makeRequest(requestType: InitialSceneInteractorRequest.RequestType)
}

struct InitialSceneInteractorRequest {
	enum RequestType {
		case testRequest
	}
}
