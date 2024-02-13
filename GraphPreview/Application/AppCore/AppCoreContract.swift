//
//  AppCoreContract.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

enum AppCoreAction {
    case uinGenerateFeedback(with: FeedbackType)
}

protocol AppCoreType: AnyObject {
    func invokeNodeAction(with type: AppCoreAction)
}
