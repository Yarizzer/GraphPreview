//
//  InitialSceneViewModel.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

final class InitialSceneViewModel { }

extension InitialSceneViewModel: InitialSceneViewModelType {
    func invoke(action type: InitialSceneViewModelActionType) {
        switch type {
        case .setupSubscription:
            #warning("Setup subscription here")
        }
    }
}
