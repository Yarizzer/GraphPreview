//
//  InitialSceneViewModelContract.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

enum InitialSceneViewModelActionType {
    case setupSubscription
}

protocol InitialSceneViewModelType: AnyObject {
    func invoke(action type: InitialSceneViewModelActionType)
}
