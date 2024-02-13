//
//  AppCore.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

final class AppCore {
    static let shared = AppCore()
    
    private init() { }
}

extension AppCore: AppCoreType {
    func invokeNodeAction(with type: AppCoreAction) {
        switch type {
        case .uinGenerateFeedback(let feedBackType):
            #warning("Plug")
            writeLog(type: .debug, message: "Plug here")
        }
    }
}
